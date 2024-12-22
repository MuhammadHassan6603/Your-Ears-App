import 'package:flutter/material.dart';
import 'package:your_ears_app/utils/color.dart';

Widget textField(String label) {
  return TextFormField(
    cursorColor: AppColors.logocontainerColor,
    decoration: InputDecoration(
      focusColor: Color(0xffcdcdcd),
      focusedBorder: UnderlineInputBorder(),
      enabledBorder: UnderlineInputBorder(),
      labelText: label,
      labelStyle: TextStyle(color: Color(0xffa3a3a3)),
      suffixIcon: label=='City' ? Icon(Icons.keyboard_arrow_down) : null
    ),
  );
}
