import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/pages/contact_screen/presentation/widget/loction_contact.dart';
import 'package:your_ears_app/pages/contact_screen/presentation/widget/logo_container.dart';
import 'package:your_ears_app/pages/contact_screen/presentation/widget/time_contat.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';

@RoutePage()
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
            SvgPicture.asset(AppImages.backwordicon),
          ],
        ),
        title: Text(
          'Contact Us',
          style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.appbarText),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoContainer(),
            SizedBox(
              height: 36,
            ),
            LoctionContact(),
            SizedBox(
              height: 38,
            ),
            TimeContat(),
          ],
        ),
      ),
    );
  }
}
