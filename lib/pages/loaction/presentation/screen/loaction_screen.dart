import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/pages/loaction/presentation/widget/google_map.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/utils/media_query.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
@RoutePage()
class LoactionScreen extends StatelessWidget {
  const LoactionScreen({super.key});

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
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        primary: true,
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppImages.backwordicon)),
          ],
        ),
        title: Text(
          'Loaction',
          style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.appbarText),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: getHeight(context) * 0.490,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.04,
                      offset: Offset(0, 04),
                      color: AppColors.conatinerblurColor),
                ],
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: AppColors.logocontainerColor,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: GoogleMapSection()),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '35 High Street, Caterham, Surrey, CR3 5UE, United Kingdom',
            style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.appbarText),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomButton(
            onTap: () {
              _openGoogleMaps();
            },
            text: "Open Google Map"),
      ),
    );
  }
}
