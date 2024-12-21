import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';

class CheckBoxRow extends StatefulWidget {
  const CheckBoxRow({super.key});

  @override
  State<CheckBoxRow> createState() => _CheckBoxRowState();
}

class _CheckBoxRowState extends State<CheckBoxRow> {
  bool isChecked = false;
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          checkColor: AppColors.checkbocColor,
          activeColor: AppColors.fieldBoderColors,
          // overlayColor: const WidgetStatePropertyAll(AppColors.),
          // focusColor: AppColors.checkColor,
          side: const BorderSide(color: AppColors.fieldBoderColors),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'I agree to The',
              style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.checktextColor)),
          TextSpan(
              text: 'Terms of Service ',
              style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fieldBoderColors)),
          TextSpan(
              text: ' and',
              style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.checktextColor)),
          TextSpan(
              text: '  Privacy Policy',
              style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fieldBoderColors)),
        ]))
      ],
    );
  }
}
