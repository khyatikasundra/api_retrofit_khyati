import 'package:api_retrofit_project/core/shared_preference_manager.dart';

const String token = "token";

class SharedPreferenceHelper {
  static SharedPreferenceManager prefs = SharedPreferenceManager();

  static Future<String?> getToken() async {
    return prefs.getToken(token);
  }

  static Future<bool> setToken(String value) async {
    return await prefs.setToken(token, value);
  }
}
