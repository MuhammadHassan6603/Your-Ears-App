import 'package:flutter/material.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/utils/media_query.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getHeight(context) * 0.228,
      decoration: BoxDecoration(
          color: AppColors.h1Colors,
          boxShadow: [
            BoxShadow(
                blurRadius: 0.04,
                offset: Offset(0, 04),
                color: AppColors.conatinerblurColor),
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Center(
        child: Container(
          height: getHeight(context) * 0.084,
          width: getHeight(context) * 0.254,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(42))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(AppImages.splashLogo),
          ),
        ),
      ),
    );
  }
}
