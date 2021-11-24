import 'package:deep_pocket_1/models/course_read.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourse_widgets.dart';
import 'package:flutter/material.dart';

import 'freecourse_mock.dart';

class enrollCard extends StatelessWidget {
  enrollCard({
    required this.course,
    required this.MHeight,
  });

  final double MHeight;

  final Course course;

  @override
  Widget build(BuildContext context) {
    final double Mwidth = MediaQuery.of(context).size.width;
    return Card(
      color: const Color(0xffd2b88b),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        // height: MHeight * 0.5,
        padding: EdgeInsets.symmetric(
            horizontal: Mwidth * 0.02, vertical: MHeight * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            enrollCard1(MHeight: MHeight, Mwidth: Mwidth, course: course),
          ],
        ),
      ),
    );
  }
}
