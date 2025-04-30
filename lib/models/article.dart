import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';

class Article {
  final int id;
  final ClothingColor primaryColor;
  final ClothingColor secondaryColor;
  final ClothingMaterial material;

  Article({
    required this.id,
    required this.primaryColor,
    required this.secondaryColor,
    required this.material,
  });
}
