import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custton_container.dart';

class GoogleContainer extends StatelessWidget {
  const GoogleContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Text(
          'Or continue with',
          style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor),
        ),
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
    );
  }
}
