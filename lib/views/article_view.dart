import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:stich/chat/chat.dart';
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
  String? _error;

  Future<void> _handleGenerateArticle() async {
    setState(() {
      _loading = true;
      _error = null;
      _classification = null;
    });

    try {
      final closet = context.read<ClosetProvider>();
      final String imageUrl = await closet.savePicture(widget.image);

      final chat = Chat();
      final response = await chat.classifyClothingImage(imageUrl: imageUrl);

      setState(() {
        _classification = response.choices.first.message.content;
      });
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        middle: const Text('Article View'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(widget.image.path),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              if (_loading)
                const CupertinoActivityIndicator()
              else
                CupertinoButton.filled(
                  onPressed: _handleGenerateArticle,
                  child: const Text('Generate Article'),
                ),
              const SizedBox(
                height: 24,
              ),
              if (_classification != null)
                Text(
                  _classification!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
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
      ),
    );
  }
}
