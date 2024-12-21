import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const CustomButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: AppColors.h1Colors,
            boxShadow: [
              BoxShadow(
                  color: AppColors.blurColor,
                  offset: Offset(04, 04),
                  blurRadius: 0.1)
            ],
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
