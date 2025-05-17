enum ClothingType {
  top("Top"),
  bottom("Bottom"),
  shoes("Shoes");

  final String name;

  const ClothingType(this.name);

  static ClothingType fromString(String type) {
    return ClothingType.values.firstWhere(
      (clothingType) => clothingType.name.toLowerCase() == type.toLowerCase(),
      orElse: () => ClothingType.top,
    );
  }
}
