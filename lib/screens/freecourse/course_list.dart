import 'package:flutter/material.dart';

import 'package:deep_pocket_1/screens/freecourse/freecourse_mock.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourse_widgets.dart';

class courseList extends StatelessWidget {
  static const route = "/freeCources/courseList";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF0E2),
        appBar: AppBar(
          backgroundColor: const Color(0xff00A6A6),
          title: const Text("Courses"),
        ),
        body: const SingleChildScrollView(child: courselistWidget()));
  }
}

class courselistWidget extends StatelessWidget {
  const courselistWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    final fieldName = ModalRoute.of(context)!.settings.arguments;
    final courses = mockCourse()
        .mockcourse
        .where((element) => element.field == fieldName)
        .toList();
    return Container(
      height: MSize.height * 0.9,
      child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, i) => courseListCard(
                course: courses[i],
              )),
    );
  }
}
