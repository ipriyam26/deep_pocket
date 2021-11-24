// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:deep_pocket_1/models/course_read.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourse_widgets.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'freecourse_enroll.dart';
import 'freecourse_mock.dart';

class courseScreen extends StatelessWidget {
  const courseScreen({Key? key}) : super(key: key);
  static const route = "/freeCources/courseList/courseScreen";

  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;
    double MWeight = MediaQuery.of(context).size.width;
    final course = ModalRoute.of(context)!.settings.arguments as Course;
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.brown,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () async {
            final url = course.courseLink;
            if (await canLaunch(url!)) {
              await launch(
                url,
                forceSafariVC: true,
                forceWebView: true,
                enableJavaScript: true,
              );
            }
          },
          label: Text(
            "ENROLL NOW",
            style: TextStyle(color: Colors.white),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(course.provider ?? "Not Defined"),
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  constraints: BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      // Color(.fromRGBO(0, 0, 128, 0.4)),
                      Color(0xfffbe9d7),
                      Color(0xfff6d5f7),

                      // Color.fromRGBO(30, 144, 255, 0.95),
                      // Color.fromRGBO(135, 206, 250, 1),
                    ],
                  )),
                  child: SingleChildScrollView(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          firstHalf(course: course),
                          SizedBox(
                            height: MHeight * 0.02,
                          ),
                          Container(
                            height: MHeight * 0.6,
                            width: MWeight * 0.9,
                            child: enrollCard(course: course, MHeight: MHeight),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
