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
  });
}
