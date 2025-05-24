enum BottomType {
  jeans("Jeans"),
  shorts("Shorts"),
  skirt("Skirt"),
  trousers("Trousers"),
  leggings("Leggings"),
  sweatpants("Sweatpants"),
  cargo("Cargo"),
  chinos("Chinos"),
  cordoroy("Corduroy"),
  unknown("Unknown");

  final String name;

  const BottomType(this.name);

  static BottomType fromString(String type) {
    return BottomType.values.firstWhere(
      (bottomType) => bottomType.name == type,
      orElse: () => BottomType.unknown,
    );
  }

  @override
  String toString() {
    return name;
  }
}
