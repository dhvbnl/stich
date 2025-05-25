import 'package:isar/isar.dart';
import 'package:stich/helpers/bottom_type.dart';
import 'package:stich/models/article.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';

part 'bottom.g.dart';

@collection
class Bottom extends Article {
  @enumerated
  final BottomType type;
  Id id = Isar.autoIncrement;

  Bottom({
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
      'type': type.toString(),
    };
  }

  @override
  String toString() {
    return 'Bottom(id: $id, primaryColor: $primaryColor, secondaryColor: $secondaryColor, material: $material, type: $type)';
  }
}
