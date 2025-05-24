import 'package:flutter/material.dart';

enum ClothingColor {
  red("Red"),
  green("Green"),
  lightBlue("Light Blue"),
  navyBlue("Navy Blue"),
  yellow("Yellow"),
  black("Black"),
  white("White"),
  gray("Gray"),
  brown("Brown"),
  purple("Purple"),
  orange("Orange"),
  pink("Pink"),
  cyan("Cyan"),
  magenta("Magenta"),
  beige("Beige"),
  none("None");

  final String name;

  const ClothingColor(this.name);

  static ClothingColor fromString(String color) {
    return ClothingColor.values.firstWhere(
      (clothingColor) => clothingColor.name == color,
      orElse: () => ClothingColor.none,
    );
  }

  Color toColor() {
    switch (this) {
      case red:
        return Colors.red;
      case green:
        return Colors.green;
      case lightBlue:
        return Colors.lightBlue;
      case navyBlue:
        return Colors.blue;
      case yellow:
        return Colors.yellow;
      case black:
        return Colors.black;
      case white:
        return Colors.white;
      case gray:
        return Colors.grey;
      case brown:
        return Colors.brown;
      case purple:
        return Colors.purple;
      case orange:
        return Colors.orange;
      case pink:
        return Colors.pink;
      case cyan:
        return Colors.cyan;
      case magenta:
        return Colors.pinkAccent;
      case beige:
        return Colors.brown.shade200;
      default:
        return Colors.black;
    }
  }

  @override
  String toString() {
    return name;
  }
}
