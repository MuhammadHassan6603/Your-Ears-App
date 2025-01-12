import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:your_ears_app/helper/share_prefences.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/logout_provider.dart';
import 'dart:convert';
import 'package:your_ears_app/routes/routes_imports.gr.dart';

@RoutePage()
class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _token;

  bool get isLoading => _isLoading;
  String? get token => _token;

  Future<void> login(
    BuildContext context,
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
          'email': email,
          'password': password,
        }),
      );
      log("try k bad");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        Provider.of<AuthProvider>(context, listen: false)
            .setToken(data['token']);
        _token = data['token'];
        final sharedPref = SharedPrefHelper();
        await sharedPref.setString(_token ?? "");
        log("Login successful, Token: $_token");
        VxToast.show(
          context,
          msg: 'Login Successful',
          bgColor: Colors.green,
          textColor: Colors.white,
        );
        context.router.replace(BottomBarRoute());
      } else {
        final errorData = jsonDecode(response.body);
        String errorMessage =
            errorData['message'] ?? "Login failed. Please try again.";
        if (errorMessage == "Invalid credentials.") {
          log("ERROR: Invalid credentials provided");
          VxToast.show(
            context,
            msg: 'Invalid credentials. Please check your email and password.',
            bgColor: Colors.red,
            textColor: Colors.white,
          );
        } else {
          log("ERROR: $errorMessage");
          VxToast.show(
            context,
            msg: errorMessage,
            bgColor: Colors.red,
            textColor: Colors.white,
          );
        }

        throw errorMessage;
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
