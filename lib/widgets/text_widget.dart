import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text(String text,double fontSize,Color color){
  return Text(text,style: GoogleFonts.inter(
    fontSize: fontSize,
    color: color
  ));
}