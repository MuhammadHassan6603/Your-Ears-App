import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';

class CongratIcon extends StatelessWidget {
  const CongratIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
          child: Center(
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue)),
              child: Center(
                child: ClipOval(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.logocontainerColor,
                      // image: DecorationImage(
                      //     image: AssetImage(''))
                    ),
                    child: Center(
                        child: Image.asset(
                      "assets/images/check.png",
                      width: 30,
                      height: 30,
                    )),
                  ),
                  //  Image.asset(
                  //   'assets/images/profile1.jpg',
                  //   width: 90,
                  //   height: 90,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Congratulations',
          style: GoogleFonts.inter(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.boldtextColor),
        ),
        SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 76),
          child: Text(
            'You’ve successfully reserved your appointment',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.successfulltextColor),
          ),
        ),
      ],
    );
  }
}
