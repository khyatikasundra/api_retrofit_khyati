import 'package:flutter/services.dart';

class Utilities {
  static Future<String> parseStringFromAssets(String assetPath) {
    return rootBundle.loadString(assetPath);
  }
}
