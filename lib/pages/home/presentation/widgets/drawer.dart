import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/media_query.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    backgroundColor: AppColors.whiteColor,
    child: Column(
      children: [
        SizedBox(
          height: getHeight(context) * 0.06,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        SizedBox(height: 5),
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
        Text(
          'View',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.blueColor,
          ),
        ),
        SizedBox(
          width: 250,
          child: Divider(color: Colors.grey.shade300)),
        ListTile(
          leading: SvgPicture.asset('assets/icons/bookings.svg'),
          title: Text('My bookings'),
          onTap: () {
            Navigator.pop(context);
            // Add navigation logic
          },
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/password.svg'),
          title: Text('Change password'),
          onTap: () {
            Navigator.pop(context);
            // Add navigation logic
          },
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/settings.svg'),
          title: Text('Setting'),
          tileColor: Colors.blue.shade50,
          onTap: () {
            Navigator.pop(context);
            // Add navigation logic
          },
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/location.svg'),
          title: Text('Location'),
          onTap: () {
            Navigator.pop(context);
            // Add navigation logic
          },
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/contact.svg'),
          title: Text('Contact Us'),
          onTap: () {
            Navigator.pop(context);
            // Add navigation logic
          },
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/about.svg'),
          title: Text('About'),
          onTap: () {
            Navigator.pop(context);
            // Add navigation logic
          },
        ),
      ],
    ),
  );
}
