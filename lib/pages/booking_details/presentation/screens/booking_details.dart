import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:your_ears_app/pages/booking_details/presentation/widgets/bottom_sheet.dart';
import 'package:your_ears_app/pages/booking_details/presentation/widgets/calender.dart';
import 'package:your_ears_app/pages/booking_details/presentation/widgets/maps.dart';
import 'package:your_ears_app/pages/booking_details/presentation/widgets/textField.dart';
import 'package:your_ears_app/pages/congratulations/presentation/screen/congratulations_screen.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/utils/media_query.dart';
import 'package:your_ears_app/widgets/custom_button.dart';

@RoutePage()
class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: SvgPicture.asset(AppImages.backwordicon)),
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                'You are booking: Ear Wax Removal',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff09A5DC)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'December 14, 2024 17:30',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7E7E7E)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '\$65 (One Ear or Both Ears) offer',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff09A5DC)),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: getWidth(context) * 0.9,
                  child: textField('Full Name')),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: getWidth(context) * 0.9,
                  child: textField('Your Email')),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: getWidth(context) * 0.9,
                  child: textField('Phone Number')),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: getWidth(context) * 0.9,
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(child: textField('City')),
                    Expanded(child: textField('Postal Code')),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: getWidth(context) * 0.9,
                child: Text(
                  'Enter Age',
                  style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffa3a3a3)),
                ),
              ),
              SizedBox(
                width: getWidth(context) * 0.9,
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(child: textField('Day')),
                    Expanded(child: textField('Month')),
                    Expanded(child: textField('Year')),
                  ],
                ),
              ),
              SizedBox(
                height: 38,
              ),
              Container(
                width: getWidth(context) * 0.9,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.blueColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: MapSection()),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '35 High Street, Caterham, Surrey, CR3 5UE, United Kingdom',
                style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff292929)),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                width: getWidth(context)*0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffcdcdcd)),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: BookingCalendar()),

              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      enableDrag: false,
                      context: context,
                      builder: (BuildContext context) {
                        return bottomSheet(context);
                      });
                },
                child: Container(
                  width: getWidth(context) * 0.9,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xffcdcdcd))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Select Time',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff292929)),
                            ),
                            Text('00:00 AM',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Color(0xff9a9a9a)))
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,size: 18)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: Color(0xff09A5DC),
                  ),
                  Text('30 Mins',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xff09A5DC))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButton(text: 'Book Now',onTap: (){
                  context.router.push(CongratulationsScreenRoute());
                },),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
