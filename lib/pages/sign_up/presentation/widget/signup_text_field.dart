import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/signup_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/visibility_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/widget/check_row.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:your_ears_app/widgets/custom_text_field.dart';

class SignupTextField extends StatefulWidget {
  const SignupTextField({super.key});

  @override
  State<SignupTextField> createState() => _SignupTextFieldState();
}

class _SignupTextFieldState extends State<SignupTextField> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _passwordConfirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        CustomTextField(
          text: 'Name',
          controller: _name,
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          text: 'Email',
          controller: _email,
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          text: 'Phone Number',
          controller: _phone,
        ),
        SizedBox(
          height: 15,
        ),
        Consumer<PasswordVisibilityProvider>(
          builder: (context, passwordProvider, _) {
            return CustomTextField(
              isPass: passwordProvider.isObscured,
              text: 'Password',
              controller: _password,
              xicon: GestureDetector(
                onTap: passwordProvider.toggleVisibility,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      passwordProvider.isObscured
                          ? AppImages.visibilityicon
                          : AppImages.invisibilityicon,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 15,
        ),
        Consumer<PasswordVisibilityProvider>(
          builder: (context, passwordProvider1, _) {
            return CustomTextField(
              isPass: passwordProvider1.isObscured1,
              text: 'Confirm Password',
              controller: _passwordConfirmation,
              xicon: GestureDetector(
                onTap: passwordProvider1.toggleVisibility1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      passwordProvider1.isObscured1
                          ? AppImages.visibilityicon
                          : AppImages.invisibilityicon, 
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        CheckBoxRow(),
        SizedBox(
          height: 28,
        ),
        Consumer<SignupProvider>(
            builder: (context, signupProvider, _) {
              return CustomButton(
                text: signupProvider.isLoading ? "Creating Account..." : "Create Account",
                onTap: () {
                  signupProvider.signup(
                    _name.text.trim(),
                    _email.text.trim(),
                    _phone.text.trim(),
                    _password.text.trim(),
                    _passwordConfirmation.text.trim(),
                  );
                },
              );
            },
          ),
        SizedBox(
          height: 28,
        ),
        GestureDetector(
          onTap: () {
            context.router.replace(SignInRoute());
          },
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Already have an account?',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.checktextColor),
            ),
            TextSpan(
              text: ' Log In',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fieldBoderColors),
            ),
          ])),
        ),
      ]),
    );
  }
}
