import 'package:dart_openai/dart_openai.dart';

class Generator {
  String model;
  String? _clothes;

  Generator({
    this.model = "gpt-4.1-nano",
  });

  set clothes(String clothes) {
    _clothes = clothes;
  }

  String generateOutfit({required String prompt}) {
    return 'lol';
  }
}
