import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stich/providers/closet_provider.dart';
import 'package:stich/providers/suggestions_provider.dart';
import 'package:stich/views/response_view.dart';

class SuggestionsView extends StatefulWidget {
  const SuggestionsView({super.key});

  @override
  State<SuggestionsView> createState() => _SuggestionsViewState();
}

class _SuggestionsViewState extends State<SuggestionsView> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ClosetProvider, SuggestionsProvider>(
      builder: (context, closet, suggestions, child) {
        if (suggestions.suggestion != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResponseView(
                  prompt: _textController.text,
                ),
              ),
            );
          });
        }
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              children: [
                _title(),
                const Spacer(),
                _input(),
                const Divider(),
                OutlinedButton(
                  onPressed: () {
                    if (_textController.text.isEmpty) {
                      return;
                    }
                    generateOutfit(
                      closet: closet,
                      suggestions: suggestions,
                      prompt: _textController.text,
                    );
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll<Color>(Colors.white),
                    shadowColor:
                        WidgetStatePropertyAll<Color>(Colors.transparent),
                    side: WidgetStatePropertyAll<BorderSide>(
                      BorderSide(
                        color: Color(0xFF7E8485),
                      ),
                    ),
                    overlayColor: WidgetStatePropertyAll<Color>(
                        Color.fromARGB(73, 126, 132, 133)),
                  ),
                  child: const Text(
                    'imagine',
                    style: TextStyle(
                      color: Color(0xFF7E8485),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _input() {
    return Row(
      children: [
        Expanded(
          child: CupertinoTextField(
            decoration: const BoxDecoration(
              border: null,
            ),
            placeholder: 'what\'s your inspiration today?',
            placeholderStyle: const TextStyle(
              color: Color(0xFF7E8485),
            ),
            controller: _textController,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.photo_camera,
            color: Color(0xFF7E8485),
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return const Row(
      children: [
        Text(
          'stitch',
          style: TextStyle(
            fontFamily: 'PlaywriteUSTrad',
            fontSize: 35,
          ),
        )
      ],
    );
  }

  void generateOutfit({
    required ClosetProvider closet,
    required SuggestionsProvider suggestions,
    required String prompt,
  }) {
    suggestions.generateOutfit(prompt: prompt, closet: closet);
  }
}
