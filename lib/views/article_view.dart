import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stich/chat/chat.dart';

class ArticleView extends StatelessWidget {
  final XFile image;
  const ArticleView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Article View'),
      ),
      child: Column(
        children: [
          Center(
            child: Image.file(
              File(image.path),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          CupertinoButton(
            onPressed: () {
              var chat = Chat();
              chat.classifyArticle(image: image).then((value) {
                print(value.choices[0].message.content);
              });
            },
            child: const Text('Generate Outfit'),
          ),
        ],
      ),
    );
  }
}
