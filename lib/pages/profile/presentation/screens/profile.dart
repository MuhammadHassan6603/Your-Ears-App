import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/calendar_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/logout_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/widget/profile_field.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final DateProvider dateProvider =
    //     Provider.of<DateProvider>(context, listen: false);
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
        actions: [
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return GestureDetector(
                onTap: () {
                  authProvider.logout(context);
                  context.router.replace(SignInRoute());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.logout),
                ),
              );
            },
          ),
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
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue)),
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile1.jpg',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Zain Clouds',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff2c3131),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    profileField('FirstName'),
                    SizedBox(
                      height: 20,
                    ),
                    profileField('YourEmail'),
                    SizedBox(
                      height: 20,
                    ),
                    profileField('Phone Number'),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Expanded(child: profileField('City')),
                        Expanded(child: profileField('Postal Code'))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter Age ",
                        style: GoogleFonts.inter(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: AppColors.successfulltextColor),
                      ),
                    ),
                    Consumer<DateProvider>(
                      builder: (context, value, child) {
                        return profileField('Date of Birth',
                            isDateField: true,
                            controller: _dobController, onTap: () async {
                          await value.pickDate(context);

                          _dobController.text =
                              value.selectedDate.toString().split(' ').first;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    profileField('Change Password'),
                    SizedBox(
                      height: 20,
                    ),
                    profileField('Confirm Password'),
                    SizedBox(
                      height: 60,
                    ),
                    CustomButton(text: "Save"),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
