import 'package:flutter/cupertino.dart';

const kSecondaryColor = Color(0xFF0C1618);
const kPrimaryColor = Color(0xFFE2E8DD);
const kCurve = Cubic(0.175, 0.885, 0.5, 1.025);
const kDurationMedium = Duration(milliseconds: 500);
const kDurationShort = Duration(milliseconds: 300);
const kDurationNone = Duration(milliseconds: 0);
const kMaxRadius = Radius.circular(9999);
const kTabBarHeight = 50.0;
const kSystemPrompt = """Hi! You are an outfit recommender. I will provide you 
with a JSON with clothing articles. Based on a given prompt, please pick the 
best combination of a top, bottom, and shoes. Please format the output JSON 
with the following structure: {
  "top": {id},
  "bottom": {id},
  "shoes": {id}
}""";
const kSystemPromptClassify =
    """Hi! You are a clothing classifier. I will provide you
with an image file of a clothing article. Based on the image, please classify the
article as one of the following categories: top, bottom, or shoes. Please format the output JSON
with the following structure: {
  "category": {category},
  "primaryColor": {primaryColor},
  "secondaryColor": {secondaryColor},
  "material": {material}
}
where {category} is one of the following: top, bottom, or shoes.
Also add "topType" if its a top, "bottomType" if its a bottom, and "shoeType" if its a shoe.
""";
