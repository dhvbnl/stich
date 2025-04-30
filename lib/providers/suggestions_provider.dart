// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/cupertino.dart';
import 'package:stich/chat/chat.dart';
import 'package:stich/models/bottom.dart';
import 'package:stich/models/outfit.dart';
import 'package:stich/models/shoes.dart';
import 'package:stich/models/top.dart';
import 'package:stich/providers/closet_provider.dart';

class SuggestionsProvider extends ChangeNotifier {
  Chat generator = Chat();
  Outfit? _suggestion;

  Outfit? get suggestion => _suggestion;

  Future<bool> generateOutfit(
      {required String prompt, required ClosetProvider closet}) async {
    if (prompt.isEmpty) {
      return false;
    }

    String topsJSON = closet.topsAsJSON();
    String bottomsJSON = closet.bottomsAsJSON();
    String shoesJSON = closet.shoesAsJSON();
    String closetJSON = '''
    {
      "tops": $topsJSON,
      "bottoms": $bottomsJSON,
      "shoes": $shoesJSON
    }
    ''';

    generator.clothes = closetJSON;

    OpenAIChatCompletionModel output = await generator.generateOutfit(
      prompt: prompt,
    );
    String response = output.choices.first.message.content!.first.text!;
    if (response.isEmpty) {
      return false;
    }

    // Parse the response to get an int from the fields: top, bottom, shoes
    // and use the ClosetProvider to get the actual objects

    // Example response: {"top": 1, "bottom": 2, "shoes": 3}
    print(response);
    Map<String, dynamic> parsedResponse = jsonDecode(response);
    int topId = parsedResponse['top'] as int;
    int bottomId = parsedResponse['bottom'] as int;
    int shoesId = parsedResponse['shoes'] as int;

    Top? top = closet.getTop(topId);
    Bottom? bottom = closet.getBottom(bottomId);
    Shoes? shoes = closet.getShoe(shoesId);
    if (top == null || bottom == null || shoes == null) {
      return false;
    }
    _suggestion = Outfit(
      top: top,
      bottom: bottom,
      shoes: shoes,
    );

    print(output.choices.first.message.toString());
    notifyListeners();
    return true;
  }
}
