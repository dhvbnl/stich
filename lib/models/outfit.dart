import 'package:stich/models/bottom.dart';
import 'package:stich/models/shoes.dart';
import 'package:stich/models/top.dart';

class Outfit {
  final Top top;
  final Bottom bottom;
  final Shoes shoes;

  Outfit({
    required this.top,
    required this.bottom,
    required this.shoes,
  });
}
