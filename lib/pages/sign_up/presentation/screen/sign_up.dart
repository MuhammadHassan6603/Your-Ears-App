import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_ears_app/pages/sign_up/presentation/widget/google_container.dart';
import 'package:your_ears_app/pages/sign_up/presentation/widget/signup_text_field.dart';
import 'package:your_ears_app/utils/media_query.dart';
import 'package:your_ears_app/widgets/signup_text.dart';

@RoutePage()
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getHeight(context) * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: signupText(context, 'Sign Up',
                  'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.'),
            ),
            SizedBox(
              height: 40,
            ),
            SignupTextField(),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 118.0),
              child: GoogleContainer(),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
