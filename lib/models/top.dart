import 'package:stich/helpers/top_type.dart';
import 'package:stich/models/article.dart';

class Top extends Article {
  final TopType type;

  Top({
    required super.id,
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
