import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final String? svgPicture;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.svgPicture,
  });

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
              offset: const Offset(4, 4),
              blurRadius: 0.1,
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(14)),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (svgPicture != null) ...[
                SvgPicture.asset(svgPicture!),
                const SizedBox(width: 8), // Spacing between icon and text
              ],
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
