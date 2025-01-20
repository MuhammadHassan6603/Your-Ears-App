import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/home/presentation/provider/service_id.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';

Widget gridWidget(BuildContext context, String imgPath, String text,int service_id) {
  return Expanded(
      child: InkWell(
        onTap: () {
          Provider.of<ServiceProvider>(context, listen: false).setServiceId(service_id);
          context.router.push(BookingDetailsRoute());
        },
        child: Container(
            height: 90,
            decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imgPath),
          fit: BoxFit.cover,
        ),
            ),
            child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withOpacity(0.4),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: AppColors.whiteColor),
          ),
        ),
            ),
          ),
      ));
}
