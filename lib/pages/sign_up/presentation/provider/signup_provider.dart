import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:your_ears_app/models/register_model.dart';

class SignupProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signup(String name, String email, String phone, String password, String passwordConfirmation) async {
    setLoading(true);
    try {
      final response = await http.post(
        Uri.parse('https://portal.yourears.co.uk/api/register'),
        body: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final registerModel = RegisterModel.fromJson(data);
        log('SIGNUP SUCCESSFUL: ${registerModel.message}');
      } else {
        log('ERROR: ${response.body}');
      }
    } catch (e) {
      log('ERROR: $e');
    } finally {
      setLoading(false);
    }
  }
}
