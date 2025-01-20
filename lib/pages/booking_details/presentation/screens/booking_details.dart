import 'dart:developer';
import 'dart:ffi';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/helper/share_prefences.dart';
import 'package:your_ears_app/pages/booking_details/data/booking_api.dart';
import 'package:your_ears_app/pages/booking_details/presentation/widgets/bottom_sheet.dart';
import 'package:your_ears_app/pages/booking_details/presentation/widgets/calender.dart';
import 'package:your_ears_app/pages/booking_details/presentation/widgets/maps.dart';
import 'package:your_ears_app/pages/booking_details/presentation/widgets/textField.dart';
import 'package:your_ears_app/pages/home/presentation/provider/service_id.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/calendar_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/widget/profile_field.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/signup_provider.dart';
import 'package:your_ears_app/routes/routes_imports.gr.dart';
import 'package:your_ears_app/utils/color.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/utils/media_query.dart';
import 'package:your_ears_app/widgets/custom_button.dart';
import 'package:intl/intl.dart';

@RoutePage()
class BookingDetails extends StatefulWidget {
  BookingDetails({
    super.key,
  });

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  int? customer_id;

  void initState() {
    // TODO: implement initState
    var userPro = Provider.of<LoginProvider>(context, listen: false);
    fullname.text = userPro.userModel!.user!.name.toString();
    email.text = userPro.userModel!.user!.email.toString();
    phoneNumber.text = userPro.userModel!.user!.phone.toString();
    customer_id = userPro.userModel!.user!.customer_id;
    super.initState();
  }

  final TextEditingController _dobController = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController postalcode = TextEditingController();
  final TextEditingController additionalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userPro = Provider.of<LoginProvider>(context, listen: false);
    final serviceId = Provider.of<ServiceProvider>(context).serviceId;
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
                  child: textField('Full Name', fullname)),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: getWidth(context) * 0.9,
                  child: textField('Your Email', email)),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: getWidth(context) * 0.9,
                  child: textField('Phone Number', phoneNumber)),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: getWidth(context) * 0.9,
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(child: textField('City', city)),
                    Expanded(child: textField('Postal Code', postalcode)),
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
                child: Consumer<DateProvider>(
                  builder: (context, value, child) {
                    return profileField('Date of Birth',
                        isDateField: true,
                        controller: _dobController, pickDate: () async {
                      await value.pickDate(context);
                      _dobController.text =
                          value.selectedDate.toString().split(' ').first;
                    }, onTap: () async {});
                  },
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
                  width: getWidth(context) * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffcdcdcd)),
                      borderRadius: BorderRadius.circular(12)),
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
                        Icon(Icons.arrow_forward_ios, size: 18)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: additionalController,
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Additional Details (optional)',
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffd0d0d0)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffb8b8b8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    maxLines: null,
                    expands: true,
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
                child: CustomButton(
                  text: 'Book Now',
                  onTap: () async {
                    log("${userPro.userModel?.user?.customer_id}");
                    final loginProvider =
                        Provider.of<LoginProvider>(context, listen: false);
                    final signupProvider =
                        Provider.of<SignupProvider>(context, listen: false);
                    SharedPrefHelper sharepref = SharedPrefHelper();
                    String? token;
                    final dateProvider =
                        Provider.of<DateProvider>(context, listen: false);
                    int age = dateProvider.calculateAge();
                    log('AGEEEEEEEE ${age.toString()}');
                    token = await sharepref.getString();
                    if (loginProvider.token != null &&
                        loginProvider.token!.isNotEmpty) {
                      log('');
                      token = loginProvider.token;
                      log(' login token $loginProvider.token');
                      // Save the token in SharedPreferences
                      await sharepref.setString(token!);
                    } else if (signupProvider.token != null &&
                        signupProvider.token!.isNotEmpty) {
                      token = signupProvider.token;
                      log(' signup  token $signupProvider.token');
                      // Save the token in SharedPreferences
                      await sharepref.setString(token!);
                    }
                    if (token == null || token.isEmpty) {
                      log('Error: No valid token found. Cannot fetch categories.');
                      return [];
                    }
                    String? userInput = additionalController.text.isEmpty
                        ? null
                        : additionalController.text;
                    log(customer_id.toString());
                    final bookingData = {
                      "customer_id": customer_id,
                      "service_id": serviceId,
                      "address": "123",
                      "city": city.text.toString(),
                      "age": age.toString(),
                      "postal_code": postalcode.text.toString(),
                      "longitude": 98.298,
                      "latitude": 98.298,
                      "booking_date": DateTime.now().toIso8601String(),
                      "additional_information": userInput,
                      "booking_time": '09:30 AM',
                      "amount_paid": "100",
                      "payment_status": "paid"
                    };
                    try {
                      sendBookingData(bookingData, token);
                    } catch (e) {
                      log('from hereeee try catch ${e.toString()}');
                    }
                  },
                ),
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
