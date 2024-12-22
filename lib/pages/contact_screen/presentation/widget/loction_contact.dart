import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';

class LoctionContact extends StatelessWidget {
  const LoctionContact({super.key});
  Future<void> _openGoogleMaps() async {
    const googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=35+High+Street,+Caterham,+Surrey,+CR3+5UE,+United+Kingdom";
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw "Could not open Google Maps";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 68),
      child: Column(
        children: [
          //  loction logo, loction text, loction button
          SvgPicture.asset(AppImages.loctionicon),
          SizedBox(
            height: 16,
          ),
          Text(
            textAlign: TextAlign.center,
            "35 High Street, Caterham, Surrey, CR3 5UE, United Kingdom",
            style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.appbarText),
          ),
          SizedBox(
            height: 19,
          ),
          GestureDetector(
            onTap: () {
              _openGoogleMaps();
            },
            child: Text(
              textAlign: TextAlign.center,
              "Open Google Map",
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.logocontainerColor),
            ),
          ),
          SizedBox(
            height: 35,
          ),

          //  contact number & logo

          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: AppColors.logocontainerColor),
            child: Icon(
              Icons.phone_outlined,
              size: 12,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            textAlign: TextAlign.center,
            "+71-0000-000",
            style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.appbarText),
          ),
        ],
      ),
    );
  }
}
