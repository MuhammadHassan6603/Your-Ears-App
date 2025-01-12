import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_ears_app/helper/share_prefences.dart';
import 'dart:async';

import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/utils/media_query.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLogo = false;

  @override
  void initState() {
    super.initState();

    // Show logo animation after 1 second
    Timer(const Duration(seconds: 1), () {
      setState(() {
        showLogo = true;
      });
    });

    Timer(const Duration(seconds: 2), () async {
      await _navigateBasedOnUserStatus();
    });
  }

  Future<void> _navigateBasedOnUserStatus() async {
    final sharedPref = SharedPrefHelper();
    final userId = await sharedPref.getString();

    if (userId != null && userId.isNotEmpty) {
      context.router.replace(BottomBarRoute());
    } else {
      context.router.replace(OnBoardingRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6E4F5),
      body: Center(
        child: AnimatedOpacity(
          opacity: showLogo ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          child: Image.asset(
            AppImages.splashLogo,
            width: getWidth(context) * 0.5,
            height: getHeight(context) * 0.25,
          ),
        ),
      ),
    );
  }
}
