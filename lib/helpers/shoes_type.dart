enum ShoesType {
  sneakers("Sneakers"),
  sandals("Sandals"),
  boots("Boots"),
  loafers("Loafers"),
  heels("Heels"),
  flats("Flats"),
  slippers("Slippers"),
  unknown("Unknown");

  final String name;

  const ShoesType(this.name);

  static ShoesType fromString(String type) {
    return ShoesType.values.firstWhere(
      (element) => element.name == type,
      orElse: () => ShoesType.unknown,
    );
  }

  @override
  String toString() {
    return name;
  }
}
