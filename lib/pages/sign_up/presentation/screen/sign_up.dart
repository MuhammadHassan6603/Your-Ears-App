import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_ears_app/pages/sign_up/presentation/widget/sign_up_bar.dart';

@RoutePage()
class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SignUpBar(),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
