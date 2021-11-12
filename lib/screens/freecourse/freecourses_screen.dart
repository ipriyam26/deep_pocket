import 'package:deep_pocket_1/models/freecourses_models.dart';

import 'package:deep_pocket_1/screens/freecourse/freecourse_widgets.dart';
import 'package:flutter/material.dart';

class freeCources extends StatelessWidget {
  static const route = '/freeCources';
  List<freecourses_models> courses = [
    freecourses_models(
      Name: "Digital Marketing",
      imgsrc: "assets/marketing.png",
    ),
    freecourses_models(
      Name: "Data Science",
      imgsrc: "assets/data.png",
    ),
    freecourses_models(
      Name: "Software & IT",
      imgsrc: "assets/it.png",
    ),
    freecourses_models(
      Name: "Designing",
      imgsrc: "assets/uiux.png",
      // number: 32,
    ),
    freecourses_models(
      Name: "Artificial Intelligence",
      imgsrc: "assets/ai.png",
    )
  ];
  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Explore All Free Courses",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color(0xff00A6A6),
        ),
        backgroundColor: const Color(0xFFFFF0E2),
        body: SingleChildScrollView(
          child: Container(
            height: MSize.height * 0.9,
            padding: EdgeInsets.symmetric(
                horizontal: MSize.width * 0.03, vertical: MSize.height * 0.02),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: MSize.width * 0.03,
                  mainAxisSpacing: 10),
              itemBuilder: (context, i) => courseButton(
                courses: courses[i],
              ),
            ),
          ),
        ));
  }
}
