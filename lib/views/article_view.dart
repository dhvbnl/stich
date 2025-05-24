import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:openai_dart/openai_dart.dart' as openai;
import 'package:provider/provider.dart';
import 'package:stich/chat/chat.dart';
import 'package:stich/helpers/bottom_type.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';
import 'package:stich/helpers/clothing_type.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/conversions.dart';
import 'package:stich/helpers/shoes_type.dart';
import 'package:stich/helpers/top_type.dart';
import 'package:stich/models/article.dart';
import 'package:stich/providers/closet_provider.dart';

class ArticleView extends StatefulWidget {
  final XFile image;
  const ArticleView({super.key, required this.image});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool _loading = false;
  String? _classification; // whatever format your model returns
  late Future<String> _firebaseUrl;
  late Future<openai.CreateChatCompletionResponse> _classificationResponse;
  String? _error;
  TempArticle? _tempArticle;
  bool _generated = false;
  final chat = Chat();

  Future<void> _startGeneration() async {
    final closet = context.read<ClosetProvider>();
    _firebaseUrl = closet.savePicture(widget.image);
    final firebaseUrl = await _firebaseUrl;
    _classificationResponse = chat.classifyClothingImage(
      imageUrl: firebaseUrl,
    );
  }

  Future<void> _handleGenerateArticle() async {
    setState(() {
      _loading = true;
      _error = null;
      _classification = null;
    });

    try {
      final firebaseUrl = await _firebaseUrl;
      final response = await _classificationResponse;

      if (response.choices.isEmpty) {
        throw Exception('No response from the model');
      }

      _classification = response.choices.first.message.content;
      _tempArticle = articleFromClassification(
        classification: _classification!,
        imageUrl: firebaseUrl,
      );
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
          _generated = true;
        });
      }
    }
  }

  _addArticleToCloset() {
    if (_tempArticle == null) return;
    final closet = context.read<ClosetProvider>();
    ClothingType type = _tempArticle!.type;
    switch (type) {
      case ClothingType.top:
        closet.addTop(
          primaryColor: _tempArticle!.primaryColor,
          secondaryColor: _tempArticle!.secondaryColor,
          material: _tempArticle!.material,
          imageUrl: _tempArticle!.imageUrl,
          type: _tempArticle!.topType!,
        );
        break;
      case ClothingType.bottom:
        closet.addBottom(
          primaryColor: _tempArticle!.primaryColor,
          secondaryColor: _tempArticle!.secondaryColor,
          material: _tempArticle!.material,
          imageUrl: _tempArticle!.imageUrl,
          type: _tempArticle!.bottomType!,
        );
        break;
      case ClothingType.shoes:
        closet.addShoes(
          primaryColor: _tempArticle!.primaryColor,
          secondaryColor: _tempArticle!.secondaryColor,
          material: _tempArticle!.material,
          imageUrl: _tempArticle!.imageUrl,
          type: _tempArticle!.shoesType!,
        );
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _startGeneration();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.image.path,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                children: [
                  if (_loading)
                    LoadingAnimationWidget.staggeredDotsWave(
                      key: const ValueKey('loading'),
                      color: kSecondaryColor,
                      size: kLoadingSize,
                    )
                  else if (_tempArticle != null && _generated)
                    _modifyTempArticleControls()
                  else
                    ElevatedButton(
                      onPressed: _handleGenerateArticle,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        foregroundColor: kPrimaryColor,
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Generate Article',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (_error != null)
                    Text(
                      _error!,
                      style: const TextStyle(
                        color: CupertinoColors.systemRed,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _modifyTempArticleControls() {
    if (_tempArticle == null) {
      return Column(
        children: [],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildDropdownRow<ClothingColor>(
            label: 'Primary Color:',
            value: _tempArticle!.primaryColor,
            items: ClothingColor.values,
            onChanged: (newValue) {
              setState(() {
                _tempArticle!.primaryColor = newValue!;
              });
            },
          ),
          _buildDropdownRow<ClothingColor>(
            label: 'Secondary Color:',
            value: _tempArticle!.secondaryColor,
            items: ClothingColor.values,
            onChanged: (newValue) {
              setState(() {
                _tempArticle!.secondaryColor = newValue!;
              });
            },
          ),
          _buildDropdownRow<ClothingMaterial>(
            label: 'Material:',
            value: _tempArticle!.material,
            items: ClothingMaterial.values,
            onChanged: (newValue) {
              setState(() {
                _tempArticle!.material = newValue!;
              });
            },
          ),
          if (_tempArticle!.type == ClothingType.top)
            _buildDropdownRow<TopType>(
              label: 'Top Type:',
              value: _tempArticle!.topType!,
              items: TopType.values,
              onChanged: (newValue) {
                setState(() {
                  _tempArticle!.topType = newValue!;
                });
              },
            ),
          if (_tempArticle!.type == ClothingType.bottom)
            _buildDropdownRow<BottomType>(
              label: 'Bottom Type:',
              value: _tempArticle!.bottomType!,
              items: BottomType.values,
              onChanged: (newValue) {
                setState(() {
                  _tempArticle!.bottomType = newValue!;
                });
              },
            ),
          if (_tempArticle!.type == ClothingType.shoes)
            _buildDropdownRow<ShoesType>(
              label: 'Shoes Type:',
              value: _tempArticle!.shoesType!,
              items: ShoesType.values,
              onChanged: (newValue) {
                setState(() {
                  _tempArticle!.shoesType = newValue!;
                });
              },
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _addArticleToCloset();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kSecondaryColor,
              foregroundColor: kPrimaryColor,
              minimumSize: const Size(200, 50),
            ),
            child: const Text(
              'Add to Closet',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownRow<T>({
    required String label,
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () => _showCupertinoPicker<T>(
          context: context,
          label: label,
          value: value,
          items: items,
          onSelectedItemChanged: onChanged,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              value.toString().split('.').last,
              style: const TextStyle(
                color: kTertiaryColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCupertinoPicker<T>({
    required BuildContext context,
    required String label,
    required T value,
    required List<T> items,
    required ValueChanged<T?> onSelectedItemChanged,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return CupertinoActionSheet(
          title: Text(label),
          message: SizedBox(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 32,
              scrollController: FixedExtentScrollController(
                initialItem: items.indexOf(value),
              ),
              onSelectedItemChanged: (index) {
                onSelectedItemChanged(items[index]);
              },
              children: items
                  .map(
                    (item) => Center(
                      child: Text(
                        item.toString().split('.').last,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Done'),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        );
      },
    );
  }
}
