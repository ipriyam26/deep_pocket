// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:deep_pocket_1/screens/freecourse/freecourse_widgets.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'freecourse_enroll.dart';
import 'freecourse_mock.dart';

class courseScreen extends StatelessWidget {
  const courseScreen({Key? key}) : super(key: key);
  static const route = "/freeCources/courseList/courseScreen";

  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;
    double MWeight = MediaQuery.of(context).size.width;
    final courseMock course =
        ModalRoute.of(context)!.settings.arguments as courseMock;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff00A6A6),
          title: Text(course.field),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      firstHalf(course: course),
                      SizedBox(
                        height: MHeight * 0.02,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                            initialPage: 1,
                            viewportFraction: 0.83,
                            // aspectRatio: 16 / 11,
                            enableInfiniteScroll: false,
                            height: MHeight * 0.55),
                        items: [0, 1, 2].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                // decoration: BoxDecoration(color: Colors.amber),
                                child: i == 0
                                    ? instructureCard(
                                        MHeight: MHeight,
                                        instructoR: course.instructors,
                                      )
                                    : i == 1
                                        ? enrollCard(
                                            MHeight: MHeight, course: course)
                                        : reviewCard(
                                            MHeight: MHeight,
                                            review: course.userReview),
                              );
                            },
                          );
                        }).toList(),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
