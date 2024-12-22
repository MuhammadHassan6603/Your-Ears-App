import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/images.dart';
import 'package:your_ears_app/utils/media_query.dart';

Widget bottomSheet(context) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    child: Container(
      height: 460,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppImages.backwordicon)
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AM',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff0B96D8)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
                SizedBox(width:10,),
                Expanded(
                    child: Column(
                  children: [
                    Text('PM',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff0B96D8))),
                    SizedBox(
                      height: 16,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                    timeContainer(context),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget timeContainer(context) {
  return Container(
    height: 41,
    width: getWidth(context) * 0.40,
    decoration: BoxDecoration(
        color: Color(0xfff8f8f8), borderRadius: BorderRadius.circular(15)),
    child: Center(
      child: Text('08:00',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff0727272))),
    ),
  );
}
