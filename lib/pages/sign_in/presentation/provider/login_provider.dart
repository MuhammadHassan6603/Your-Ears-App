import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:your_ears_app/helper/share_prefences.dart';
import 'package:your_ears_app/models/register_model.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/logout_provider.dart';
import 'dart:convert';
import 'package:your_ears_app/routes/routes_imports.gr.dart';

// @RoutePage()
class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _token;
  RegisterModel? userModel;

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

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data["token"];
        log("userdata ${data}");
        Provider.of<AuthProvider>(context, listen: false)
            .setToken(data['token']);
        RegisterModel userData = RegisterModel.fromJson(data);
        log("user data ${userData.user}");
        userModel = userData;

        final sharedPref = SharedPrefHelper();
        sharedPref.setUserModel(userData);
        log("$_token ");
        await sharedPref.setString(_token ?? "");
        String? id = await sharedPref.getString();
        log(" share pre id $id");
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

  //get user data
  getUserData() async {
    final sharedPref = SharedPrefHelper();
    var data = await sharedPref.getUserModel();
    userModel = data;
    notifyListeners();
  }

//   delete account function

  Future<void> deleteAccount(BuildContext context, String password) async {
    log('delete acc api');
    final url = Uri.parse('https://portal.yourears.co.uk/api/profile/delete');

    try {
      final response = await http.delete(
        url,
        headers: {
          // if (token != null)
          'Authorization': 'Bearer ${userModel!.token}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'password': password,
        }),
      );
      log("token is ${_token}");

      if (response.statusCode >= 200 || response.statusCode <= 300) {
        final sharedPref = SharedPrefHelper();
        await sharedPref.removeString();
        await sharedPref.removeUserModel();
        log("remove model share pres $sharedPref.removeUserModel()");

        context.router.replace(SignUpRoute());
        log('Account deleted successfully');
        VxToast.show(context,
            msg: 'Account deleted successfully',
            bgColor: Colors.green,
            textColor: Colors.white);
      } else {
        log('Failed to delete account ${response.statusCode}: ${response.body}');
        VxToast.show(context,
            msg: 'Failed to delete account',
            bgColor: Colors.red,
            textColor: Colors.white);
      }
    } catch (e) {
      log('An error occurred: $e');
      VxToast.show(context,
          msg: 'Something went wrong',
          bgColor: Colors.red,
          textColor: Colors.white);
    }
  }
}
