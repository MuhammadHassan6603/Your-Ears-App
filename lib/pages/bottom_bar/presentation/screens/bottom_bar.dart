import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/bottom_bar/presentation/provider/bottom_bar_provider.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      body: bottomBarProvider.currentScreen,
      backgroundColor: AppColors.fillColors,
      bottomNavigationBar: BottomAppBar(
        height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(AppImages.homeIcon, "Home", 0, context),
            _buildNavItem(AppImages.calenderIcon, "Calander", 1, context),
            _buildNavItem(AppImages.contactUsIcon, "Contact Us", 2, context),
            _buildNavItem(AppImages.profileIcon, "Profile", 3, context),
          
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index, BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);
    final bool isSelected = bottomBarProvider.selectedIndex == index;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: () => bottomBarProvider.setIndex(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 40,
        width: isSelected ? 100 : 40,
        decoration: isSelected
            ? BoxDecoration(
                // color: AppColors.logincontainercolor,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              color: isSelected ? AppColors.fillColors : AppColors.fieldtextColors,
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'hind',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.fillColors,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}