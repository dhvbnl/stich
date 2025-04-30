import 'package:flutter/cupertino.dart';
import 'package:stich/models/bottom.dart';
import 'package:stich/models/shoes.dart';
import 'package:stich/models/top.dart';

import 'package:collection/collection.dart';

class ClosetProvider extends ChangeNotifier {
  final List<Top> _tops;
  final List<Bottom> _bottoms;
  final List<Shoes> _shoes;

  ClosetProvider({
    required List<Top> tops,
    required List<Bottom> bottoms,
    required List<Shoes> shoes,
  })  : _tops = tops,
        _bottoms = bottoms,
        _shoes = shoes;

  List<Top> get tops => _tops;
  List<Bottom> get bottoms => _bottoms;
  List<Shoes> get shoes => _shoes;

  Top? getTop(int id) {
    return _tops.firstWhereOrNull((top) => top.id == id);
  }

  Bottom? getBottom(int id) {
    return _bottoms.firstWhereOrNull((bottom) => bottom.id == id);
  }

  Shoes? getShoe(int id) {
    return _shoes.firstWhereOrNull((shoe) => shoe.id == id);
  }

  String topsAsJSON() {
    return _tops.map((top) => top.toJson()).toList().toString();
  }

  String bottomsAsJSON() {
    return _bottoms.map((bottom) => bottom.toJson()).toList().toString();
  }

  String shoesAsJSON() {
    return _shoes.map((shoe) => shoe.toJson()).toList().toString();
  }
}
