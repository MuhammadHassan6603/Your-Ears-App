import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/pages/sign_up/presentation/widget/signup_text_field.dart';
import 'package:your_ears_app/utils/media_query.dart';
import 'package:your_ears_app/widgets/custom_text_field.dart';
import 'package:your_ears_app/widgets/signup_text.dart';

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
            child: signupText(context, 'Sign Up',
                'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.'),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SignupTextField(),
          )
        ],
      ),
    );
  }
}
