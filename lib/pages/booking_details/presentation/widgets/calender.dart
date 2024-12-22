import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';

class BookingCalendar extends StatefulWidget {
  const BookingCalendar({super.key});

  @override
  State<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  List<DateTime?> _dates = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        CalendarDatePicker2WithActionButtons(
          config: CalendarDatePicker2WithActionButtonsConfig(
            firstDayOfWeek: 1,
            calendarType: CalendarDatePicker2Type.range,
            selectedDayTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            selectedDayHighlightColor: AppColors.logocontainerColor,
            centerAlignModePicker: true,
            // dayBuilder: ( context, day, isSelected) {
            //   // Ensure day is of type `DateTime`
            //   final date = day as DateTime;

            //   Color? backgroundColor;

            //   // Custom colors for specific date ranges
            //   if (date.day >= 10 && date.day <= 13) {
            //     backgroundColor = Colors.red;
            //   } else if (date.day >= 20 && date.day <= 23) {
            //     backgroundColor = Colors.green;
            //   } else if (date.day == 24 || date.day == 25) {
            //     backgroundColor = Colors.yellow;
            //   }

            //   return Container(
            //     decoration: BoxDecoration(
            //       color: backgroundColor,
            //       shape: BoxShape.circle,
            //     ),
            //     alignment: Alignment.center,
            //     child: Text(
            //       '${date.day}',
            //       style: TextStyle(
            //         color: isSelected ? Colors.white : Colors.black,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   );
            // },
          ),
          value: _dates,
          onValueChanged: (dates) {
            setState(() {
              _dates = dates;
            });
          },
        ),
        SizedBox(height: 20),
        // Text(
        //   'Selected Dates:',
        //   style: GoogleFonts.poppins(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w600,
        //     color: AppColors.blackCOlor,
        //   ),
        // ),
        // ..._dates.map((date) => Text(
        //       date != null
        //           ? "${date.day}/${date.month}/${date.year}"
        //           : "No date selected",
        //       style: GoogleFonts.poppins(
        //         fontSize: 12,
        //         fontWeight: FontWeight.w400,
        //         color: AppColors.blackCOlor,
        //       ),
        //     )),
      ],
    );
  }
}

Widget buildLegendItem({required Color color, required String label}) {
  return Row(
    children: [
      Container(
        height: 14,
        width: 14,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
      SizedBox(width: 4),
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.blackCOlor,
        ),
      ),
    ],
  );
}
