// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:deep_pocket_1/models/course_read.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourse_widgets.dart';
import 'package:flutter/material.dart';



class enrollCard extends StatelessWidget {
  const enrollCard({Key? key, 
    required this.course,
    required this.MHeight,
  }) : super(key: key);

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
