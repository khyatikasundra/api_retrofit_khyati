import 'package:api_retrofit_project/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  SharedPreferenceManager._();
  static final SharedPreferenceManager _instance = SharedPreferenceManager._();
  factory SharedPreferenceManager() => _instance;

  final SharedPreferences _prefs = serviceLocator<SharedPreferences>();

  Future<bool> setToken(String key, String value) async {
   return await _prefs.setString(key, value);
  }

  String? getToken(String key) {
    return _prefs.getString(key);
  }
}
