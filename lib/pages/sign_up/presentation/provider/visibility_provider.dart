import 'package:flutter/material.dart';

class PasswordVisibilityProvider with ChangeNotifier {
  bool _isObscured = true;
  bool _isObscured1 = true;

  bool get isObscured => _isObscured;
  bool get isObscured1 => _isObscured1;

  void toggleVisibility() {
    _isObscured = !_isObscured;
    notifyListeners();
  }
  void toggleVisibility1() {
    _isObscured1 = !_isObscured1;
    notifyListeners();
  }
}
