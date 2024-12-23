import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/contact_screen/presentation/screen/contact_screen.dart';
import 'package:your_ears_app/pages/forget_screen/presentation/screen/forget_screen.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/sign_in_visibility.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/visibility_provider.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:your_ears_app/widgets/custom_text_field.dart';

@RoutePage()
class SiginTextField extends StatelessWidget {
  const SiginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomTextField(text: 'Email/Phone Number'),
          SizedBox(
            height: 15,
          ),
          Consumer<SignInVisibilityProvider>(
            builder: (context, passwordProvider, _) {
              return CustomTextField(
                isPass: passwordProvider.isObscured,
                text: 'Password',
                xicon: GestureDetector(
                  onTap: passwordProvider.toggleVisibility,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        passwordProvider.isObscured
                            ? AppImages.visibilityicon
                            : AppImages
                                .invisibilityicon, // Use appropriate icons
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                context.router.push(ForgetScreenRoute());
              },
              child: Text(
                'Forget Password?',
                style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.forgetColor),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          CustomButton(
              onTap: () {
                context.router.replace(BottomBarRoute());
              },
              text: 'LogIn'),
          SizedBox(
            height: 28,
          ),
          GestureDetector(
            onTap: () {
              context.router.replace(SignUpRoute());
            },
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Create a new account?',
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.checktextColor),
              ),
              TextSpan(
                text: ' Sign up',
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.fieldBoderColors),
              ),
            ])),
          ),
        ],
      ),
    );
  }
}
