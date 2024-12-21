import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/pages/sign_up/presentation/widget/check_row.dart';
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
      child: Column(spacing: 15, children: [
        CustomTextField(text: 'Name'),
        CustomTextField(text: 'Email/Phone Number'),
        CustomTextField(
          isPass: true,
          text: 'Password',
          xicon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.visibilityicon),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: CheckBoxRow(),
        ),
        SizedBox(
          height: 32,
        ),
        CustomButton(text: "Create Account"),
        SizedBox(
          height: 28,
        ),
        RichText(
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
      ]),
    );
  }
}
