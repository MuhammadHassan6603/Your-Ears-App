import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:your_ears_app/routes/routes_imports.gr.dart';

@RoutePage()
class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _token;

  bool get isLoading => _isLoading;
  String? get token => _token;

  Future<void> login(
    String email,
    String password,
  ) async {
    const String url = "https://portal.yourears.co.uk/api/login";
    _isLoading = true;
    // notifyListeners();

    try {
      log("res send");
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      log("try k bad");
      if (response.statusCode == 200) {
        // Successful login

        final data = jsonDecode(response.body);
        _token = data['token'];
        log("Login successful, Token: $_token");
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData['message'] ?? "Login failed. Please try again.";
      }
    } catch (error) {
      log("Error during login: $error");
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
