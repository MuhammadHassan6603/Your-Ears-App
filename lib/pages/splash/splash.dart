import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:your_ears_app/pages/boarding/on_boarding.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';

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
    Timer(const Duration(seconds: 1), () {
      setState(() {
        showLogo = true;
      });
    });
    Timer(const Duration(seconds: 2), () {
      context.router.replace(SignUpRoute());
    });
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
            'assets/icons/logo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
