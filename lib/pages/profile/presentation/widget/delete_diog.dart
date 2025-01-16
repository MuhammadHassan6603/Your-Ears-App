import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';

void showDialogBox(BuildContext context) {
  var logPro = Provider.of<LoginProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          'Confirm Deletion',
          style: GoogleFonts.inter(
              color: AppColors.h1Colors,
              fontWeight: FontWeight.w500,
              fontSize: 17),
        ),
        content: Text(
          'Are you sure you want to delete your account?',
          style: GoogleFonts.inter(
              color: AppColors.blackCOlor,
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    logPro.deleteAccount(context);
                    // context.router.replace(SignUpRoute());
                  },
                  child: Text(
                    "Yes",
                    style: GoogleFonts.inter(
                      color: AppColors.blackCOlor,
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    log("Account deletion canceled.");
                  },
                  child: Text(
                    "No",
                    style: GoogleFonts.inter(
                      color: AppColors.blackCOlor,
                    ),
                  )),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //     // Add logic for deleting the account here
              //     log("Account deletion confirmed.");
              //   },
              //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              //   child: Text('Yes'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //     log("Account deletion canceled.");
              //   },
              //   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              //   child: Text('No'),
              // ),
            ],
          ),
        ],
      );

      //  Dialog(
      //   backgroundColor: Colors.white,
      //   insetPadding: EdgeInsets.zero,
      //   child: SizedBox(
      //       width: getWidth(context) * 0.85,
      //       height: getHeight(context) * 0.2,
      //       child: Column(
      //         children: [
      //           Align(
      //             alignment: Alignment.topRight,
      //             child: GestureDetector(
      //               onTap: () {
      //                 Navigator.pop(context);
      //               },
      //               child: Padding(
      //                 padding: const EdgeInsets.only(right: 15.0, top: 15),
      //                 child: Icon(
      //                   Icons.close,
      //                   color: Color(0xff5A5A5A),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       )),
      // );
    },
  );
}
