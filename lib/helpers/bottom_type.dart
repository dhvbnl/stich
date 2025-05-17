enum BottomType {
  jeans("jeans"),
  shorts("shorts"),
  skirt("skirt"),
  trousers("trousers"),
  leggings("leggings"),
  sweatpants("sweatpants"),
  cargo("cargo"),
  chinos("chinos"),
  cordoroy("corduroy"),
  unknown("unknown");

  final String name;

  const BottomType(this.name);

  static BottomType fromString(String type) {
    return BottomType.values.firstWhere(
      (bottomType) => bottomType.name == type,
      orElse: () => BottomType.unknown,
    );
  }
}
