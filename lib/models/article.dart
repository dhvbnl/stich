import 'package:stich/helpers/bottom_type.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';
import 'package:stich/helpers/clothing_type.dart';
import 'package:stich/helpers/shoes_type.dart';
import 'package:stich/helpers/top_type.dart';

class Article {
  final int id;
  final ClothingColor primaryColor;
  final ClothingColor secondaryColor;
  final ClothingMaterial material;
  String imageUrl;

  Article({
    required this.id,
    required this.primaryColor,
    required this.secondaryColor,
    required this.material,
    this.imageUrl = '',
  });
}

class TempArticle {
  ClothingColor primaryColor;
  ClothingColor secondaryColor;
  ClothingMaterial material;
  String imageUrl;
  ClothingType type;
  TopType? topType;
  BottomType? bottomType;
  ShoesType? shoesType;

  TempArticle({
    required this.primaryColor,
    required this.secondaryColor,
    required this.material,
    this.imageUrl = '',
    required this.type,
    this.topType,
    this.bottomType,
    this.shoesType,
  });

  @override
  String toString() {
    return 'TempArticle{\n'
        '  primaryColor: $primaryColor,\n'
        '  secondaryColor: $secondaryColor,\n'
        '  material: $material,\n'
        '  imageUrl: $imageUrl,\n'
        '  type: $type,\n'
        '  topType: $topType,\n'
        '  bottomType: $bottomType,\n'
        '  shoesType: $shoesType\n'
        '}';
  }
}
