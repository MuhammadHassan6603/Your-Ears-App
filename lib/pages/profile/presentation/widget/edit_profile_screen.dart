import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/models/register_model.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/calendar_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/image_picker_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/update_profile_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/widget/camrra_dilog_box.dart';
import 'package:your_ears_app/pages/profile/presentation/widget/profile_field.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    var userPro = Provider.of<LoginProvider>(context, listen: false);
    fullname.text = userPro.userModel!.user!.name.toString();
    email.text = userPro.userModel!.user!.email.toString();
    phoneNumber.text = userPro.userModel!.user!.phone.toString();
    city.text = userPro.userModel?.user?.city == true
        ? userPro.userModel!.user!.city!
        : "";
    postalcode.text = userPro.userModel?.user?.postalCode?.isNotEmpty == true
        ? userPro.userModel!.user!.postalCode!
        : '';
    _dobController.text = userPro.userModel?.user?.dateOfBirth?.isEmpty == true
        ? userPro.userModel!.user!.dateOfBirth!
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
    var imagepickProvider =
        Provider.of<ImageProviderModel>(context, listen: false);
    var updateProvider =
        Provider.of<ProfileProviderUpdate>(context, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<ImageProviderModel>(
                  builder: (context, value, child) {
                    return ClipOval(
                      child: value.pickedImage != null
                          ? Image.file(
                              value.pickedImage!,
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            )
                          : userPro.userModel?.user?.profilePic?.isNotEmpty ==
                                  true
                              ? Image.network(
                                  userPro.userModel!.user!.profilePic
                                      .toString(),
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/profile1.jpg',
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                    );
                  },
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
          height: 10,
        ),

        //  image picker
        GestureDetector(
          onTap: () {
            showImageSourceDialog(context, onCameraTap: () {
              Navigator.pop(context);
              imagepickProvider.pickImage(ImageSource.gallery);
            }, onGalleryTap: () {
              Navigator.pop(context);
              imagepickProvider.pickImage(ImageSource.camera);
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 6,
            children: [
              Text(
                'Edit',
                style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blueColor),
              ),
              SvgPicture.asset(AppImages.edit),
            ],
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
                      child:
                          profileField(controller: postalcode, 'Postal Code'))
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
              profileField(controller: Confirmpassword, 'Confirm Password'),
              SizedBox(
                height: 60,
              ),
              CustomButton(
                  onTap: updateProvider.isLoading
                      ? null
                      : () async {
                          var imagePro = Provider.of<ImageProviderModel>(
                              context,
                              listen: false);
                          User user = User(
                            profilePic: imagePro.pickedImage != null
                                ? imagePro.pickedImage!.path
                                : userPro.userModel!.user!.profilePic,
                            name: fullname.text,
                            email: email.text,
                            phone: phoneNumber.text,
                            city: city.text,
                            postalCode: postalcode.text,
                            dateOfBirth: _dobController.text,
                          );
                          final success =
                              await updateProvider.updateProfile(user);
                          if (success) {
                            log("Profile updated successfully!");
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text('Profile updated successfully!')),
                            // );
                          }
                          log("Failed to update profile.");
                          //  else {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //         content: Text('Failed to update profile.')),
                          //   );
                          // }
                        },
                  text: "Save"),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
