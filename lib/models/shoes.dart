import 'package:stich/helpers/shoes_type.dart';
import 'package:stich/models/article.dart';

class Shoes extends Article {
  final ShoesType type;

  Shoes({
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
    return 'Shoes(id: $id, primaryColor: $primaryColor, secondaryColor: $secondaryColor, material: $material, type: $type)';
  }
}
