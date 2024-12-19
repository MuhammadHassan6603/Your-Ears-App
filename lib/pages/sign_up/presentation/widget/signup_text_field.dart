import 'package:flutter/material.dart';
import 'package:your_ears_app/widgets/custom_text_field.dart';

class SignupTextField extends StatelessWidget {
  const SignupTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        CustomTextField(text: 'Name'),
        CustomTextField(text: 'Email/Phone Number'),
        CustomTextField(text: 'Password'),
      ],
    );
  }
}