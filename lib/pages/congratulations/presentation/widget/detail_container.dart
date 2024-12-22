import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/utils/media_query.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context) * 0.435,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xffF8F8F8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            SizedBox(
              height: 34,
            ),
            Row(
              children: [
                Text(
                  'Appointment no',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.successfulltextColor),
                ),
                Spacer(),
                Text(
                  '#879862194172',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.boldtextColor),
                ),
              ],
            ),
            Divider(
              height: 10,
              color: Color(0xffE8E8E8),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Text(
                  'Type of',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.successfulltextColor),
                ),
                Spacer(),
                Text(
                  'EarWax Removal',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.boldtextColor),
                ),
              ],
            ),
            Divider(
              height: 10,
              color: Color(0xffE8E8E8),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.successfulltextColor),
                ),
                Spacer(),
                Text(
                  'Zain Clouds',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.boldtextColor),
                ),
              ],
            ),
            Divider(
              height: 10,
              color: Color(0xffE8E8E8),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Text(
                  'Date and time',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.successfulltextColor),
                ),
                Spacer(),
                Text(
                  '04 Dec 2024 17:45',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.boldtextColor),
                ),
              ],
            ),
            Divider(
              height: 10,
              color: Color(0xffE8E8E8),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Text(
                  'Payment',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.successfulltextColor),
                ),
                Spacer(),
                Text(
                  'Cash Only',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.boldtextColor),
                ),
              ],
            ),
            Divider(
              height: 10,
              color: Color(0xffE8E8E8),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Text(
                  'Duration',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.successfulltextColor),
                ),
                Spacer(),
                Row(
                  spacing: 5,
                  children: [
                    SizedBox(
                        width: 14,
                        height: 14,
                        child: Image.asset(AppImages.clock)),
                    Text(
                      '30 Minutes',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.logocontainerColor),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
