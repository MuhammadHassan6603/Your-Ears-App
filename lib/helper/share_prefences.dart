import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static final SharedPrefHelper _instance = SharedPrefHelper._internal();

  factory SharedPrefHelper() {
    return _instance;
  }

  SharedPrefHelper._internal();

  /// Save a string value to SharedPreferences
  Future<void> setString(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', value);
  }

  /// Retrieve a string value from SharedPreferences
  Future<String?> getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  /// Remove a specific key from SharedPreferences
  Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  /// Clear all SharedPreferences
  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
