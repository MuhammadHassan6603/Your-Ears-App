import 'dart:convert';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:your_ears_app/helper/share_prefences.dart';
import 'package:your_ears_app/models/register_model.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/logout_provider.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _token;
  String? get token => _token;
  RegisterModel? _userModel;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signup(BuildContext context, String name, String email,
      String phone, String password, String passwordConfirmation) async {
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
        final sharedPref = SharedPrefHelper();
        final data = json.decode(response.body);
        final registerModel = RegisterModel.fromJson(data);
        Provider.of<AuthProvider>(context, listen: false)
            .setToken(data['token']);
        _token = data['token'];
        //set user model in share pref
        await sharedPref.setUserModel(registerModel);
        await sharedPref.setString(_token ?? "");
        log('SIGNUP SUCCESSFUL: ${registerModel.message},$_token');
        VxToast.show(context,
            msg: 'Signup Successful',
            bgColor: Colors.green,
            textColor: Colors.white);
        context.router.replace(BottomBarRoute());
      } else {
        final errorData = jsonDecode(response.body);
        if (errorData['errors'] != null) {
          final emailErrors = errorData['errors']['email']?.join(", ");
          final phoneErrors = errorData['errors']['phone']?.join(", ");

          if (emailErrors != null && emailErrors.isNotEmpty) {
            VxToast.show(
              context,
              msg: emailErrors,
              bgColor: Colors.red,
              textColor: Colors.white,
            );
          } else if (phoneErrors != null && phoneErrors.isNotEmpty) {
            VxToast.show(
              context,
              msg: phoneErrors,
              bgColor: Colors.red,
              textColor: Colors.white,
            );
          }
          log('ERROR: ${response.statusCode} - $emailErrors, $phoneErrors');
        } else {
          String errorMessage =
              errorData['message'] ?? "Signup failed. Please try again.";
          log('ERROR: ${response.statusCode} - $errorMessage');
          VxToast.show(
            context,
            msg: errorMessage,
            bgColor: Colors.red,
            textColor: Colors.white,
          );
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  //get user data
  getUserData() async {
    final sharedPref = SharedPrefHelper();
    var data = await sharedPref.getUserModel();
    _userModel = data;
    notifyListeners();
  }
}
