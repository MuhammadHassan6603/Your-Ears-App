import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/bottom_bar/presentation/provider/bottom_bar_provider.dart';
import 'package:your_ears_app/pages/bottom_bar/presentation/widgets/navbar_item.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
@RoutePage()
class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      body: bottomBarProvider.currentScreen,
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.whiteColor,
        height: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(AppImages.homeIcon, "Home", 0, context),
            buildNavItem(AppImages.calenderIcon, "Calander", 1, context),
            buildNavItem(AppImages.contactUsIcon, "Contact", 2, context),
            buildNavItem(AppImages.profileIcon, "Profile", 3, context),
          ],
        ),
      ),
    );
  }
}