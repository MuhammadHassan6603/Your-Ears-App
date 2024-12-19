import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/pages/boarding/presentation/screens/content_model.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/media_query.dart';

@RoutePage()
class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfafcfd),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: getHeight(context) * 0.7,
            child: PageView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                                width: getWidth(context),
                                height: 400,
                                child: Image.asset(
                                  contents[i].image,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  contents.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    width: currentIndex == index ? 12 : 8,
                                    height: currentIndex == index ? 12 : 8,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? Colors.black
                                          : AppColors.boardingText,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: getWidth(context) * 0.9,
                              child: Text(
                                contents[i].title,
                                style: GoogleFonts.roboto(
                                    color: AppColors.h1Colors,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: getWidth(context) * 0.9,
                              child: Text(
                                contents[i].description,
                                style: GoogleFonts.roboto(
                                    color: AppColors.boardingText,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ))
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 60,
            width: getWidth(context) * 0.9,
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Skip',
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        color: AppColors.skip,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    if (currentIndex < contents.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      // Navigator.pushReplacementNamed(
                      //     context, '/login');
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.h1Colors),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
