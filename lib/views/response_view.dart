import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:stich/main.dart';
import 'package:stich/models/bottom.dart';
import 'package:stich/models/shoes.dart';
import 'package:stich/models/top.dart';
import 'package:stich/providers/suggestions_provider.dart';

class ResponseView extends StatelessWidget {
  final String prompt;
  final Isar isar;
  const ResponseView(
      {super.key, required this.prompt, required this.isar});

  @override
  Widget build(BuildContext context) {
    return Consumer<SuggestionsProvider>(
        builder: (context, suggestions, child) {
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              title(suggestions),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      top(suggestions.suggestion!.top),
                      SizedBox(height: 16),
                      bottom(suggestions.suggestion!.bottom),
                      SizedBox(height: 16),
                      shoes(suggestions.suggestion!.shoes),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              button(context, suggestions)
            ],
          ),
        ),
      );
    });
  }

  Widget title(SuggestionsProvider suggestions) {
    return Text(
      prompt,
      style: const TextStyle(fontSize: 28, color: Color(0xFF7E8485)),
    );
  }

  Widget button(BuildContext context, SuggestionsProvider suggestions) {
    return OutlinedButton(
        onPressed: () {
          suggestions.setNull();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainApp(isar: isar)),
          );
        },
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
          shadowColor: WidgetStatePropertyAll<Color>(Colors.transparent),
          side: WidgetStatePropertyAll<BorderSide>(
            BorderSide(
              color: Color(0xFF7E8485),
            ),
          ),
          overlayColor:
              WidgetStatePropertyAll<Color>(Color.fromARGB(73, 126, 132, 133)),
        ),
        child: const Text(
          'back',
          style: TextStyle(color: Color(0xFF7E8485)),
        ));
  }

  Widget top(Top top) {
    return _clothingItem(top.imageUrl);
  }

  Widget bottom(Bottom bottom) {
    return _clothingItem(bottom.imageUrl);
  }

  Widget shoes(Shoes shoes) {
    return _clothingItem(shoes.imageUrl);
  }

  Widget _clothingItem(String url) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Image.network(
        url,
        width: 200,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 200,
            height: 200,
            color: Colors.grey[300],
            child: Icon(
              Icons.broken_image,
              size: 50,
              color: Colors.grey[700],
            ),
          );
        },
      ),
    );
  }
}
