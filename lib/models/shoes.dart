import 'package:isar/isar.dart';
import 'package:stich/helpers/shoes_type.dart';
import 'package:stich/models/article.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';

part 'shoes.g.dart';

@collection
class Shoes extends Article {
  @enumerated
  final ShoesType type;
  Id id = Isar.autoIncrement;

  Shoes({
    required super.primaryColor,
    required super.secondaryColor,
    required super.material,
    required this.type,
    super.imageUrl = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'primaryColor': primaryColor,
      'secondaryColor': secondaryColor,
      'material': material,
      'type': type.name,
    };
  }

  @override
  String toString() {
    return 'Shoes(id: $id, primaryColor: $primaryColor, secondaryColor: $secondaryColor, material: $material, type: $type)';
  }
}
