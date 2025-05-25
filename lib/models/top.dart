import 'package:stich/helpers/top_type.dart';
import 'package:stich/models/article.dart';
import 'package:isar/isar.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';

part 'top.g.dart';

@collection
class Top extends Article {
  @enumerated
  final TopType type;
  Id id = Isar.autoIncrement;

  Top({
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
    return 'Top(id: $id, primaryColor: $primaryColor, secondaryColor: $secondaryColor, material: $material, type: $type)';
  }
}
