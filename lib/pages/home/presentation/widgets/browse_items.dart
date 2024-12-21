import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';

Widget getBrowseIcons(BuildContext context) {
  List<String> imgPaths = [
    'assets/images/category1.png',
    'assets/images/category2.png',
    'assets/images/category3.png',
    'assets/images/category4.png',
    'assets/images/category5.png',
    'assets/images/category6.png',
    'assets/images/category7.png',
    'assets/images/category8.png',
  ];

  List<String> texts = [
    'EarWax',
    'Assessment',
    'Blogs',
    'Protecting',
    'Kids',
    'Protecting',
    'Assessment',
    'Others'
  ];

  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: imgPaths.length,
    itemBuilder: (context, index) {
      return Padding(
        padding:  EdgeInsets.only(left: index==0 ? 20:14),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
                child: Image.asset(
              imgPaths[index],
              fit: BoxFit.cover,
              width: 70,
              height: 70,
            )),
            Text(
              texts[index],
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: AppColors.browseItemText
              )
            ),
          ],
        ),
      );
    },
  );
}
