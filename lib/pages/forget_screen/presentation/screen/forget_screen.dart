import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_ears_app/pages/forget_screen/presentation/widget/forget_field.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:your_ears_app/widgets/custom_text_field.dart';
import 'package:your_ears_app/widgets/signup_text.dart';

@RoutePage()
class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: signupText(context, 'Forget Password',
                'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.'),
          ),
          SizedBox(
            height: 70,
          ),
          ForgetField(),
        ],
      ),
    );
  }
}
