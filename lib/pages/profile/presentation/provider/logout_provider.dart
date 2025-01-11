import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthProvider with ChangeNotifier {
  String? _token;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    if (_token == null) {
      VxToast.show(context, msg: 'No token available', bgColor: Colors.red, textColor: Colors.white);
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://portal.yourears.co.uk/api/logout'),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        _token = null;
        VxToast.show(context, msg: 'Logged out successfully', bgColor: Colors.green, textColor: Colors.white);

        // Navigate to the login screen
        // context.router.replace(LoginRoute());
      } else {
        final errorData = json.decode(response.body);
        VxToast.show(context, msg: errorData['message'], bgColor: Colors.red, textColor: Colors.white);
        log('Logout failed: ${response.body}');
      }
    } catch (e) {
      log('Logout error: $e');
      VxToast.show(context, msg: 'Error logging out: $e', bgColor: Colors.red, textColor: Colors.white);
    }
  }
}