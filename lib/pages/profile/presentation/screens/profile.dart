import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/calendar_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/logout_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/widget/delete_diog.dart';
import 'package:your_ears_app/pages/profile/presentation/widget/profile_field.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    var userPro = Provider.of<LoginProvider>(context, listen: false);
    fullname.text = userPro.userModel!.user!.name.toString();
    email.text = userPro.userModel!.user!.email.toString();
    phoneNumber.text = userPro.userModel!.user!.phone.toString();
    city.text = userPro.userModel?.customer?.city?.isEmpty == true
        ? userPro.userModel!.customer!.city!
        : "";
    postalcode.text =
        userPro.userModel?.customer?.postalCode?.isNotEmpty == true
            ? userPro.userModel!.customer!.postalCode!
            : '';
    _dobController.text =
        userPro.userModel?.customer?.dateOfBirth?.isEmpty == true
            ? userPro.userModel!.customer!.dateOfBirth!
            : "";
    super.initState();
  }

  final TextEditingController _dobController = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController postalcode = TextEditingController();
  final TextEditingController changepassword = TextEditingController();
  final TextEditingController Confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userPro = Provider.of<LoginProvider>(context, listen: false);
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
          // Consumer<AuthProvider>(
          //   builder: (context, authProvider, child) {
          //     return GestureDetector(
          //       onTap: () {
          //         authProvider.logout(context);
          //       },
          //       child: Padding(
          //         padding: const EdgeInsets.only(right: 15.0),
          //         child: Icon(Icons.logout),
          //       ),
          //     );
          //   },
          // ),
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
                        child: userPro.userModel?.userProfilePic?.isNotEmpty ==
                                true
                            ? Image.network(
                                userPro.userModel!.userProfilePic.toString(),
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    Image.asset('assets/images/profile.png')),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                userPro.userModel!.user!.name.toString(),
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
                    profileField(controller: fullname, 'Full Name'),
                    SizedBox(
                      height: 20,
                    ),
                    profileField(controller: email, 'Your Email'),
                    SizedBox(
                      height: 20,
                    ),
                    profileField(controller: phoneNumber, 'Phone Number'),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Expanded(child: profileField(controller: city, 'City')),
                        Expanded(
                            child: profileField(
                                controller: postalcode, 'Postal Code'))
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
                            controller: _dobController, pickDate: () async {
                          await value.pickDate(context);

                          if (value.selectedDate != null) {
                            _dobController.text =
                                value.selectedDate.toString().split(' ').first;
                          }
                        }, onTap: () async {});
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    profileField(controller: changepassword, 'Change Password'),
                    SizedBox(
                      height: 20,
                    ),
                    profileField(
                        controller: Confirmpassword, 'Confirm Password'),
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
