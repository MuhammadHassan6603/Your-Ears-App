import 'package:flutter/material.dart';
import 'package:your_ears_app/pages/bottom_bar/presentation/widgets/navbar_item.dart';
import 'package:your_ears_app/pages/home/presentation/screens/home.dart';
import 'package:your_ears_app/pages/home/presentation/widgets/drawer.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';

class MegaHomeScreen extends StatefulWidget {
  const MegaHomeScreen({super.key});

  @override
  _MegaHomeScreenState createState() => _MegaHomeScreenState();
}

class _MegaHomeScreenState extends State<MegaHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main content of the screen
          Scaffold(
              appBar: AppBar(
                title: Text('Home'),
                leading: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child: Icon(Icons.menu),
                ),
              ),
              body: HomeScreen(),
              bottomNavigationBar: BottomAppBar(
                color: AppColors.whiteColor,
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildNavItem(AppImages.homeIcon, "Home", 0, context),
                    buildNavItem(
                        AppImages.calenderIcon, "Calander", 1, context),
                    buildNavItem(
                        AppImages.contactUsIcon, "Contact", 2, context),
                    buildNavItem(AppImages.profileIcon, "Profile", 3, context),
                  ],
                ),
              )),
          // Drawer that overlaps everything
          Positioned.fill(
            child: Builder(
              builder: (context) {
                return drawer(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
