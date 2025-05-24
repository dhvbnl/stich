import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stich/helpers/bottom_type.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';
import 'package:stich/helpers/clothing_type.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/shoes_type.dart';
import 'package:stich/helpers/top_type.dart';
import 'package:stich/models/article.dart';

SvgPicture getSvgFromArticle({
  required ClothingType type,
  TopType? topType,
  BottomType? bottomType,
  ShoesType? shoesType,
  required ClothingColor primaryColor,
  required ClothingColor secondaryColor,
}) {
  if ((type == ClothingType.top && topType == null) ||
      (type == ClothingType.bottom && bottomType == null) ||
      (type == ClothingType.shoes && shoesType == null)) {
    throw Exception('Invalid article: Missing specific type for $type');
  }
  String svgPath = '';
  switch (type) {
    case ClothingType.top:
      svgPath = 'assets/top_icons/$topType.svg';
    case ClothingType.bottom:
      svgPath = 'assets/bottom_icons/$bottomType.svg';
      break;
    case ClothingType.shoes:
      svgPath = 'assets/shoes_icons/$shoesType.svg';
      break;
  }
  return SvgPicture.asset(
    svgPath,
    colorFilter: ColorFilter.mode(
      primaryColor.toColor(),
      BlendMode.srcIn,
    ),
    width: 100,
    height: 100,
  );
}

TempArticle articleFromClassification(
    {required String classification, required String imageUrl}) {
  // Parse the JSON string into a Map
  final Map<String, dynamic> json = jsonDecode(classification);

  // Check if the JSON contains the required keys
  if (!json.containsKey('category') ||
      !json.containsKey('primaryColor') ||
      !json.containsKey('secondaryColor') ||
      !json.containsKey('material')) {
    throw Exception('Invalid JSON format');
  }
  if (!kValidCategories.contains(json['category'])) {
    throw Exception('Invalid category: ${json['category']}');
  }

  final category = ClothingType.fromString(json['category']);
  var article = TempArticle(
    imageUrl: imageUrl,
    type: category,
    primaryColor: ClothingColor.fromString(json['primaryColor'] ?? ''),
    secondaryColor: ClothingColor.fromString(json['secondaryColor'] ?? ''),
    material: ClothingMaterial.fromString(json['material'] ?? ''),
    topType: category == ClothingType.top
        ? TopType.fromString(json['topType'])
        : null,
    bottomType: category == ClothingType.bottom
        ? BottomType.fromString(json['bottomType'])
        : null,
    shoesType: category == ClothingType.shoes
        ? ShoesType.fromString(json['shoeType'])
        : null,
  );
  return article;
}
