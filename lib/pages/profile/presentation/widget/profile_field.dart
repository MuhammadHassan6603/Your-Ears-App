import 'package:flutter/material.dart';
import 'package:your_ears_app/utils/color.dart';

// class ProfileField extends StatelessWidget {
//   const ProfileField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return

//   }
// }

Widget profileField(String label,
    {TextEditingController? controller,
    bool isDateField = false,
    VoidCallback? onTap,
    VoidCallback? pickDate}) {
  return GestureDetector(
    onTap: isDateField ? onTap : null,
    child: TextFormField(
      controller: controller,
      readOnly: isDateField,
      obscureText: label == "Change Password" || label == "Confirm Password",
      cursorColor: AppColors.logocontainerColor,
      decoration: InputDecoration(
        focusColor: const Color(0xffCDCDCD),
        focusedBorder: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.successfulltextColor),
        suffixIcon: isDateField
            ? InkWell(
                onTap: pickDate,
                child: const Icon(Icons.calendar_today, color: Colors.grey))
            : null,
      ),
    ),
  );
}
