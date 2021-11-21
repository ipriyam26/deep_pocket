import 'package:deep_pocket_1/models/freecourses_models.dart';
import 'package:deep_pocket_1/screens/freecourse/catagory_model.dart';

import 'package:deep_pocket_1/screens/freecourse/freecourse_widgets.dart';
import 'package:flutter/material.dart';

class freeCources extends StatelessWidget {
  static const route = '/freeCources';

  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    var courses = ModelCatagory().courseE;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Explore All Free Courses",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: MSize.width * 0.03, vertical: MSize.height * 0.02),
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
        ));
  }
}
