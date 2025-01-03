import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/visibility_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/widget/check_row.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:your_ears_app/widgets/custom_text_field.dart';

class SignupTextField extends StatelessWidget {
  const SignupTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        CustomTextField(text: 'Name'),
        SizedBox(
          height: 15,
        ),
        CustomTextField(text: 'Email/Phone Number'),
        SizedBox(
          height: 15,
        ),
        Consumer<PasswordVisibilityProvider>(
          builder: (context, passwordProvider, _) {
            return CustomTextField(
              isPass: passwordProvider.isObscured,
              text: 'Password',
              xicon: GestureDetector(
                onTap: passwordProvider.toggleVisibility,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      passwordProvider.isObscured
                          ? AppImages.visibilityicon
                          : AppImages.invisibilityicon, // Use appropriate icons
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        // SizedBox(
        //   height: 8,
        // ),
        CheckBoxRow(),
        SizedBox(
          height: 28,
        ),
        CustomButton(
          text: "Create Account",
          onTap: () {
            context.router.replace(SignInRoute());
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
