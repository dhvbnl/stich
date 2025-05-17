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

  @override
  String toString() {
    return name;
  }
}
