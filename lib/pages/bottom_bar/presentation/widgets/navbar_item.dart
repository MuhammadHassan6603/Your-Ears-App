import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/bottom_bar/presentation/provider/bottom_bar_provider.dart';
import 'package:your_ears_app/utils/color.dart';

Widget buildNavItem(String iconPath, String label, int index, BuildContext context) {
  final bottomBarProvider = Provider.of<BottomBarProvider>(context);
  final bool isSelected = bottomBarProvider.selectedIndex == index;

  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    onTap: () => bottomBarProvider.setIndex(index),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 44,
      width: isSelected ? 100 : 50,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blueColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? AppColors.fillColors : AppColors.fieldtextColors,
            width: 20,height: 20,
          ),
          if (isSelected)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: isSelected ? 1.0 : 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.fillColors,
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}