import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/pages/home/presentation/widgets/browse_items.dart';
import 'package:your_ears_app/pages/home/presentation/widgets/drawer.dart';
import 'package:your_ears_app/pages/home/presentation/widgets/grid_items.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/media_query.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          scrolledUnderElevation: 0,
          elevation: 0,
          primary: true,
          leading: Builder(
            builder: (context) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: AppColors.blueColor,
                  size: 30,
                ),
              );
            },
          ),
          title: Text(
            'Your Ears',
            style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.blueColor),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile1.jpg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        drawer: drawer(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(context) * 0.02,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: getWidth(context) * 0.9,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(child: Builder(builder: (context) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/doctor.png',
                              fit: BoxFit.cover,
                            ));
                      })),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exclusive Offer!',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColors.whiteColor),
                            ),
                            Text(
                              'Earwax Removel \$75 ONLY',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.whiteColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'From Nov 24- Dec 24',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: AppColors.containerTextColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 73,
                              height: 23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.blueColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Book Now!',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      color: AppColors.whiteColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Browse Categories',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.blueColor),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(height: 120, child: getBrowseIcons(context)),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Ear Wax & Hair Assessment',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.blueColor),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              gridItems(context)
            ],
          ),
        ));
  }
}
