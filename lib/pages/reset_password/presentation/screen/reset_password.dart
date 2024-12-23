import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_ears_app/pages/reset_password/presentation/widget/reset_field.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/media_query.dart';
import 'package:your_ears_app/widgets/signup_text.dart';

@RoutePage()
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          SizedBox(
            height: getHeight(context) * 0.15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: signupText(context, 'Reset Password',
                'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.'),
          ),
          SizedBox(
            height: getHeight(context) * 0.17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ResetField(),
          ),
        ],
      ),
    );
  }
}
