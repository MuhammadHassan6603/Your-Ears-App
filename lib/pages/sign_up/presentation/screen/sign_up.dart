import 'package:flutter/material.dart';
import 'package:your_ears_app/pages/sign_up/presentation/widget/sign_up_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SignUpBar(),
        ],
      ),
    );
  }
}
