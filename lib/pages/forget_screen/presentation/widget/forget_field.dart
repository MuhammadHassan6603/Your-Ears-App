import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:your_ears_app/widgets/custom_text_field.dart';
@RoutePage()
class ForgetField extends StatelessWidget {
  const ForgetField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 32,
        children: [
          CustomTextField(text: "Email ID/ Mobile Number"),
          CustomButton(
              onTap: () {
                context.router.push(OtpScreenRoute());
              },
              text: "Continue")
        ],
      ),
    );
  }
}
