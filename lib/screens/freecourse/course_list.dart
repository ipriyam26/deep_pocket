
// ignore_for_file: camel_case_types, avoid_print, non_constant_identifier_names

import 'package:deep_pocket_1/models/course_read.dart';
import 'package:deep_pocket_1/read_data.dart';
import 'package:flutter/material.dart';


import 'package:deep_pocket_1/screens/freecourse/freecourse_widgets.dart';


class courseList extends StatelessWidget {
  static const route = "/freeCources/courseList";

  const courseList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
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
            return const SafeArea(child: Center(child: CircularProgressIndicator()));
          }
          print(courses.data!.length);
          return SizedBox(
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
