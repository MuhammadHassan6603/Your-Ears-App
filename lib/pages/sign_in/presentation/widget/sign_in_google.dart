import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:your_ears_app/widgets/custton_container.dart';

class SignInGoogle extends StatelessWidget {
  const SignInGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Column(
            children: [
              Text(
                'Or continue with',
                style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CusttonContainer(
                    svgPicture: AppImages.googleicon,
                  ),
                  CusttonContainer(svgPicture: AppImages.facebookicon),
                  CusttonContainer(svgPicture: AppImages.appleicon),
                ],
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 50,
        // ),
      ],
    );
  }
}
