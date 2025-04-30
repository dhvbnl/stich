import 'package:stich/helpers/bottom_type.dart';
import 'package:stich/models/article.dart';

class Bottom extends Article {
  final BottomType type;

  Bottom({
    required super.id,
    required super.primaryColor,
    required super.secondaryColor,
    required super.material,
    required this.type,
  });
}
