import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/widgets/custom_text_field.dart';

void showDialogBox(BuildContext context) {
  var logPro = Provider.of<LoginProvider>(context, listen: false);

  final TextEditingController passwordController = TextEditingController();
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
          Column(
            spacing: 10,
            children: [
              Text(
                'Please Enter Your password',
                style: GoogleFonts.inter(
                    color: AppColors.blackCOlor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              CustomTextField(
                text: 'password',
                controller: passwordController,
                isPass: true,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () async {
                        await logPro.deleteAccount(
                            context, passwordController.text);
                        log('delete account ');
                        VxToast.show(context,
                            msg: ' delete account',
                            bgColor: Colors.green,
                            textColor: Colors.white);

                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Delete",
                        style: GoogleFonts.inter(
                          color: AppColors.h1Colors,
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        log("Account deletion canceled.");
                      },
                      child: Text(
                        "cancle",
                        style: GoogleFonts.inter(
                          color: AppColors.blackCOlor,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}
