import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:your_ears_app/pages/congratulations/presentation/widget/congrat_icon.dart';
import 'package:your_ears_app/pages/congratulations/presentation/widget/detail_container.dart';
import 'package:your_ears_app/pages/home/presentation/screens/home.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
@RoutePage()
class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        primary: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppImages.backwordicon)),
          ],
        ),
      ),
      body: Column(
        spacing: 25,
        children: [
          CongratIcon(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DetailContainer(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomButton(text: "Done",onTap: (){
          context.router.replace(BottomBarRoute());
        },),
      ),
    );
  }
}
