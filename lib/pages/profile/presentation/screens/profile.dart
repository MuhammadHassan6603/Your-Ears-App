// ignore_for_file: non_constant_identifier_names
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/logout_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/widget/delete_diog.dart';
import 'package:your_ears_app/pages/profile/presentation/widget/edit_profile_screen.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      //  App bar

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
        actions: [
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              // popUpAnimationStyle: AnimationStyle(duration: Durations.medium2),
              position: PopupMenuPosition.under,
              color: AppColors.whiteColor,
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                      child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        showDialogBox(context);
                      },
                      child: Text(
                        'Account Delete',
                        style: TextStyle(
                            color: AppColors.blackCOlor,
                            fontFamily: 'mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
                  PopupMenuItem(child: Center(
                    child: Consumer<AuthProvider>(
                        builder: (context, authProvider, child) {
                      return GestureDetector(
                        onTap: () {
                          authProvider.logout(context);
                        },
                        child: Text(
                          'Log out',
                          style: TextStyle(
                              color: AppColors.blackCOlor,
                              fontFamily: 'mulish',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      );
                    }),
                  )),
                ];
              },
              child: const Icon(
                Icons.more_vert,
              )),
        ],
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.appbarText),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EditProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
