import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';

class AboutUpDate extends StatelessWidget {
  const AboutUpDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          "Your system is up to Date",
          style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.blackCOlor),
        ),
        SizedBox(
          height: 28,
        ),
        Text(
          textAlign: TextAlign.center,
          "App verison: 2346752973v",
          style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.abouttextColor),
        ),
        SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          "App security update: December 10, 2024",
          style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.abouttextColor),
        ),
      ],
    );
  }
}
