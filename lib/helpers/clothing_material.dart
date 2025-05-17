enum ClothingMaterial {
  cotton("Cotton"),
  polyester("Polyester"),
  wool("Wool"),
  silk("Silk"),
  linen("Linen"),
  denim("Denim"),
  leather("Leather"),
  rayon("Rayon"),
  spandex("Spandex"),
  suede("Suede"),
  velvet("Velvet"),
  canvas("Canvas"),
  fleece("Fleece"),
  unknown("Unknown");

  final String name;

  const ClothingMaterial(this.name);

  static ClothingMaterial fromString(String material) {
    return ClothingMaterial.values.firstWhere(
      (clothingMaterial) => clothingMaterial.name == material,
      orElse: () => ClothingMaterial.unknown,
    );
  }

  @override
  String toString() {
    return name;
  }
}
