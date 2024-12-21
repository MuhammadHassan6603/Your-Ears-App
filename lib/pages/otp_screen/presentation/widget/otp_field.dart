import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/pages/reset_password/presentation/screen/reset_password.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtpTextField(
          fieldHeight: 55,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          numberOfFields: 5,
          focusedBorderColor: AppColors.h1Colors,

          showFieldAsBox: true,

          onCodeChanged: (String code) {},
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                });
          },
        ),
        SizedBox(
          height: 21,
        ),
        CustomButton(
            onTap: () {
              context.router.push(ResetPasswordRoute());
            },
            text: "Reset Password"),
        SizedBox(
          height: 21,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Didn’t get OTP?',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.checktextColor),
            ),
            TextSpan(
              text: ' Resend OTP',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fieldBoderColors),
            ),
          ])),
        ),
      ],
    );
  }
}
