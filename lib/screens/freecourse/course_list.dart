import 'package:deep_pocket_1/get_course.dart';
import 'package:deep_pocket_1/models/course_read.dart';
import 'package:deep_pocket_1/read_data.dart';
import 'package:flutter/material.dart';

import 'package:deep_pocket_1/screens/freecourse/freecourse_mock.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourse_widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class courseList extends StatelessWidget {
  static const route = "/freeCources/courseList";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF0E2),
        appBar: AppBar(
          backgroundColor: Colors.black,
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
    final path = ModalRoute.of(context)!.settings.arguments as String;

    return FutureBuilder(
        future: sendData().ReadJsonData(path),
        builder: (context, AsyncSnapshot<List<Course>> courses) {
          if (!courses.hasData) {
            return SafeArea(child: Center(child: CircularProgressIndicator()));
          }
          print(courses.data!.length);
          return Container(
            height: MSize.height * 0.9,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: courses.data!.length,
                itemBuilder: (context, index) => courseListCard(
                      course: courses.data![index],
                    )),
          );
        });
  }
}
