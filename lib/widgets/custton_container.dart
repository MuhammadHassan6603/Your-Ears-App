import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:your_ears_app/utils/color.dart';

class CusttonContainer extends StatelessWidget {
  final String svgPicture;
  const CusttonContainer({super.key, required this.svgPicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: AppColors.checkbocColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPicture),
        ],
      ),
    );
  }
}
