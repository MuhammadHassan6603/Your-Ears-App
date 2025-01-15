import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_ears_app/models/register_model.dart';

class SharedPrefHelper {
  static final SharedPrefHelper _instance = SharedPrefHelper._internal();

  factory SharedPrefHelper() {
    return _instance;
  }

  SharedPrefHelper._internal();

  /// Save a string value to SharedPreferences
  Future<void> setString(String value) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs;
    await _prefs.setString('userId', value);
  }

  //user model set
  Future<void> setUserModel(RegisterModel model) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final usermodel = jsonEncode(model.toJson());
    await _prefs.setString("user_model", usermodel);
  }

  //user model set
  Future<RegisterModel> getUserModel() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    RegisterModel? model;
    final data = _prefs.getString("user_model");
    model = RegisterModel.fromJson(jsonDecode(data!));
    return model;
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
