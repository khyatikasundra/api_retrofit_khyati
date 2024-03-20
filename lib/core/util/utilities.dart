import 'package:flutter/services.dart';

class Utilities {
  static Future<String> parseStringFromAssets(String assetPath) {
    return rootBundle.loadString(assetPath);
  }

  static T enumFromString<T>(String key, List<T> values) => values.firstWhere(
        (v) => key == (v! as Enum).name,
      );
}
