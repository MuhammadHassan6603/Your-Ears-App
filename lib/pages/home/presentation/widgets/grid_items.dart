import 'package:flutter/material.dart';
import 'package:your_ears_app/pages/home/presentation/widgets/gridWidgets.dart';

Widget gridItems(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      spacing: 15,
      children: [
        Row(
          spacing: 15,
          children: [
            gridWidget(context, 'assets/images/grid1.png', 'Assessment'),
            gridWidget(context, 'assets/images/grid2.png', 'Testing'),
          ],
        ),
        Row(
          spacing: 15,
          children: [
            gridWidget(context, 'assets/images/grid3.png', 'Ear Wax Removal'),
            gridWidget(context, 'assets/images/grid4.png', 'Book Appointment'),
          ],
        ),


        Row(
          spacing: 15,
          children: [
            gridWidget(context, 'assets/images/grid4.png', 'Book Appointment'),
            gridWidget(context, 'assets/images/grid2.png', 'Others'),
          ],
        ),
        Row(
          spacing: 15,
          children: [
            gridWidget(context, 'assets/images/grid2.png', 'Others'),
            gridWidget(context, 'assets/images/grid3.png', 'Ear Wax Removal'),
          ],
        ),
      ],
    ),
  );
}
