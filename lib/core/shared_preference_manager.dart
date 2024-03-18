import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

class SharedPreferenceManager {
  SharedPreferenceManager._();

  static SharedPreferenceManager? _instance;

  factory SharedPreferenceManager() {
    _instance ??= SharedPreferenceManager._();
    return _instance!;
  }

  final SharedPreferences _prefs = serviceLocator<SharedPreferences>();

  Future<bool> setToken(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getToken(String key) {
    return _prefs.getString(key);
  }
  Future<bool> clear() async=> await _prefs.clear();
}


