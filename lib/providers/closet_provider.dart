import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stich/helpers/bottom_type.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';
import 'package:stich/helpers/shoes_type.dart';
import 'package:stich/helpers/top_type.dart';
import 'package:stich/models/bottom.dart';
import 'package:stich/models/shoes.dart';
import 'package:stich/models/top.dart';

import 'package:collection/collection.dart';

class ClosetProvider extends ChangeNotifier {
  final List<Top> _tops;
  final List<Bottom> _bottoms;
  final List<Shoes> _shoes;
  final firebaseStorage = FirebaseStorage.instance.ref();

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

  /// Adds a new top to the closet.
  void addTop({
    String imageUrl = '',
    required ClothingColor primaryColor,
    required ClothingColor secondaryColor,
    required ClothingMaterial material,
    required TopType type,
  }) {
    //get max id from list of tops
    //change to be more efficient later
    int maxId = _tops.isNotEmpty
        ? _tops.map((top) => top.id).reduce((a, b) => a > b ? a : b)
        : 0;
    //create new top
    Top newTop = Top(
      id: maxId + 1,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      material: material,
      type: type,
      imageUrl: imageUrl,
    );
    //add new top to list
    _tops.add(newTop);
    notifyListeners();
  }

  /// Adds a new bottom to the closet.
  void addBottom({
    String imageUrl = '',
    required ClothingColor primaryColor,
    required ClothingColor secondaryColor,
    required ClothingMaterial material,
    required BottomType type,
  }) {
    //get max id from list of bottoms
    //change to be more efficient later
    int maxId = _bottoms.isNotEmpty
        ? _bottoms.map((bottom) => bottom.id).reduce((a, b) => a > b ? a : b)
        : 0;
    //create new bottom
    Bottom newBottom = Bottom(
      id: maxId + 1,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      material: material,
      type: type,
      imageUrl: imageUrl,
    );
    //add new bottom to list
    _bottoms.add(newBottom);
    notifyListeners();
  }

  /// Adds a new shoe to the closet.
  void addShoes({
    String imageUrl = '',
    required ClothingColor primaryColor,
    required ClothingColor secondaryColor,
    required ClothingMaterial material,
    required ShoesType type,
  }) {
    //get max id from list of shoes
    //change to be more efficient later
    int maxId = _shoes.isNotEmpty
        ? _shoes.map((shoe) => shoe.id).reduce((a, b) => a > b ? a : b)
        : 0;
    //create new shoe
    Shoes newShoe = Shoes(
      id: maxId + 1,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      material: material,
      type: type,
      imageUrl: imageUrl,
    );
    //add new shoe to list
    _shoes.add(newShoe);
    notifyListeners();
  }

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

  /// Saves a picture to Firebase Storage and returns the download URL.
  /// [path] is the local path of the image to be saved.
  /// Returns the download URL of the saved image.
  Future<String> savePicture(XFile file) async {
    // Pick a unique filename
    final filename = '${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Storage reference (adjust if you store FirebaseStorage.instance elsewhere)
    final ref = FirebaseStorage.instance.ref().child('images').child(filename);

    // Kick off the upload
    final uploadTask = ref.putFile(
      File(file.path),
      SettableMetadata(contentType: 'image/jpeg'),
    );

    // Progress listener
    uploadTask.snapshotEvents.listen((snap) {
      debugPrint('Progress: ${snap.bytesTransferred}/${snap.totalBytes}');
    });

    try {
      // Wait for completion once
      final TaskSnapshot snapshot = await uploadTask;

      if (snapshot.state == TaskState.success) {
        // Safer: use the ref embedded in the TaskSnapshot you just got
        final downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      }

      // Any non‑success state is treated as an error
      throw FirebaseException(
        plugin: 'firebase_storage',
        code: snapshot.state.toString(),
        message: 'Upload failed with state ${snapshot.state}',
      );
    } on FirebaseException catch (e) {
      // Permission errors, quota exceeded, etc.
      debugPrint('Firebase Storage error: ${e.code} — ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unknown error while uploading image: $e');
      throw Exception('Failed to upload image: $e');
    }
  }
}
