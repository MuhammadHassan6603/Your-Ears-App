import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';

// class ProfileField extends StatelessWidget {
//   const ProfileField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return

//   }
// }

Widget profileField(
  String lable,{
    TextEditingController? controller,
  }
  
) {
  return TextFormField(
    controller: controller,
    obscureText: lable == "Change Password" || lable == "Confirm Password",
    cursorColor: AppColors.logocontainerColor,
    decoration: InputDecoration(
        focusColor: Color(0xffCDCDCD),
        focusedBorder: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(),
        labelText: lable,
        labelStyle: TextStyle(color: AppColors.successfulltextColor),
        suffixIcon: lable == 'City'
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.downarrowicon),
                ],
              )
            : null),
  );
}
