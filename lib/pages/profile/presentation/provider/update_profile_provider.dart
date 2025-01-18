import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:your_ears_app/models/register_model.dart';

class ProfileProviderUpdate with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  RegisterModel? userModel;

  Future<bool> updateProfile(User user) async {
    final url = Uri.parse('https://portal.yourears.co.uk/api/profile/update');
    _isLoading = true;
    notifyListeners();

    try {
      userModel!.copyWith(user: user);
      final body = jsonEncode(userModel!.toJson());
      log("body jsonencode $userModel!.toJson()");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${userModel!.token}',
        },
        body: body,
      );
      log('hehehhee $response');

      _isLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        return true;
      } else {
        log('Error: ${response.body}');
        return false;
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      log('Exception: $error');
      return false;
    }
  }
}
