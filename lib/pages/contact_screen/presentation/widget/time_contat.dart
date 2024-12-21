import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';

class TimeContat extends StatelessWidget {
  const TimeContat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: 24, height: 24, child: Image.asset(AppImages.clock)),
        SizedBox(
          height: 10,
        ),
        Text(
          textAlign: TextAlign.center,
          "Monday - Friday",
          style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.appbarText),
        ),
        Text(
          textAlign: TextAlign.center,
          "9:00AM - 5:00PM",
          style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.appbarText),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          textAlign: TextAlign.center,
          "Saturday - Sunday",
          style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.appbarText),
        ),
        Text(
          textAlign: TextAlign.center,
          "11:00AM - 2:00PM",
          style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.appbarText),
        ),
      ],
    );
  }
}
