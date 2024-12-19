import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Boarding'),),
    );
  }
}