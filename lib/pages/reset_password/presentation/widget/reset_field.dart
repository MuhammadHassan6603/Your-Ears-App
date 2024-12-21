import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:your_ears_app/widgets/custom_text_field.dart';

@RoutePage()
class ResetField extends StatefulWidget {
  const ResetField({super.key});

  @override
  State<ResetField> createState() => _ResetFieldState();
}

class _ResetFieldState extends State<ResetField> {
  bool isLoading = false;

  void handleSubmit() async {
    setState(() {
      isLoading = true;
    });

    // Simulate network call or processing
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    // Navigate to SignInRoute
    context.router.replace(SignInRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          isPass: true,
          text: 'New Password',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          text: 'Confirm Password',
          isPass: true,
          xicon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.visibilityicon),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          onTap:
              isLoading ? null : handleSubmit, // Disable button while loading
          text: isLoading
              ? "Submitting..." // Button text changes during loading
              : "Submit",
          svgPicture: isLoading // Conditionally show progress indicator
              ? AppImages.loader
              : null,
        ),
        if (isLoading)
          const SizedBox(
            height: 20,
          ),
      ],
    );
  }
}
