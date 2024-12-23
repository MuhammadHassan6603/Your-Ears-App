import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_ears_app/pages/sign_in/presentation/widget/sigin_text_field.dart';
import 'package:your_ears_app/pages/sign_in/presentation/widget/sign_in_google.dart';
import 'package:your_ears_app/utils/media_query.dart';
import 'package:your_ears_app/widgets/signup_text.dart';

@RoutePage()
class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: getHeight(context) * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: signupText(context, 'Sign In',
                    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.'),
              ),
              SizedBox(
                height: getHeight(context) * 0.100,
              ),
              SiginTextField(),
              SizedBox(
                height: getHeight(context) * 0.100,
              ),
              SignInGoogle(),
            ],
          ),
        ),
      ),
    );
  }
}
