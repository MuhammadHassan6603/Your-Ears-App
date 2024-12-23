import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/check_box_provider.dart';
import 'package:your_ears_app/utils/color.dart';

class CheckBoxRow extends StatelessWidget {
  const CheckBoxRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<CheckBoxProvider>(
          builder: (context, checkBoxProvider, _) {
            return Checkbox(
              checkColor: AppColors.checkbocColor,
              activeColor: AppColors.fieldBoderColors,
              side: const BorderSide(color: AppColors.fieldBoderColors),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: checkBoxProvider.isChecked,
              onChanged: (value) {
                checkBoxProvider.toggleCheck(value!);
              },
            );
          },
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'I agree to The',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.checktextColor,
                ),
              ),
              TextSpan(
                text: ' Terms of Service ',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fieldBoderColors,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.checktextColor,
                ),
              ),
              TextSpan(
                text: ' Privacy Policy',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fieldBoderColors,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
