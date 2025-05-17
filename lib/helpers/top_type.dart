enum TopType {
  tshirt("T-Shirt"),
  polo("Polo"),
  shirt("Shirt"),
  jacket("Jacket"),
  sweater("Sweater"),
  tankTop("Tank Top"),
  longSleeve("Long Sleeve"),
  sweatshirt("Sweatshirt"),
  buttonDown("Button Down"),
  unknown("Unknown");

  final String name;

  const TopType(this.name);

  static TopType fromString(String type) {
    return TopType.values.firstWhere(
      (topType) => topType.name == type,
      orElse: () => TopType.unknown,
    );
  }

  @override
  String toString() {
    return name;
  }
}
