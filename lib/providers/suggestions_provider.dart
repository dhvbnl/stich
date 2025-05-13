// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:openai_dart/openai_dart.dart';
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

    generator.wardrobeDescription = closetJSON;

    CreateChatCompletionResponse output =
        await generator.getOutfitSuggestions(userPrompt: prompt);
    String response = output.choices.first.message.content!;
    if (response.isEmpty) {
      return false;
    }

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
