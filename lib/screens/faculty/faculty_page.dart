// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:deep_pocket_1/screens/faculty/faculty_model.dart';
import 'faculty_widgets.dart';

class facultyPage extends StatelessWidget {
  static const route = '/school-screen/faculty-screen/faculty-page';

  const facultyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> pageN = ['bio'];
    final teacher = ModalRoute.of(context)!.settings.arguments as Faculty_model;
    final MWidth = MediaQuery.of(context).size.width;
    final MHeight = MediaQuery.of(context).size.height;

    if (teacher.Education.isNotEmpty) {
      pageN.add('Education');
    }
    if (teacher.Experience.isNotEmpty) {
      pageN.add('Experience');
    }
    if (teacher.Projects.isNotEmpty) {
      pageN.add('Projects');
    }
    if (teacher.Distinction.isNotEmpty) {
      pageN.add('Distinction');
    }
    if (teacher.Research.isNotEmpty) {
      pageN.add('Research');
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MHeight * 0.034,
          ),
          Hero(
            tag: teacher.profile,
            child: SizedBox(
              height: MWidth,
              width: MWidth,
              child: CachedNetworkImage(
                placeholder: (context, url) => SizedBox(
                    height: MWidth * 0.1,
                    width: MWidth * 0.1,
                    child: const CircularProgressIndicator(
                      color: Colors.grey,
                    )),
                imageUrl: teacher.Image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
                // aspectRatio: 20 / 9,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                height: MHeight * 0.5,
                initialPage: 0),
            items: pageN.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.amber),

                      child: i == 'bio'
                          ? NameAndStuff(
                              MWidth: MWidth,
                              MHeight: MHeight,
                              teacher: teacher)
                          : i == 'Education'
                              ? cardHeading(
                                  list: teacher.Education,
                                  MHeight: MHeight,
                                  MWidth: MWidth,
                                  heading: 'Education',
                                )
                              : i == 'Experience'
                                  ? cardHeading(
                                      list: teacher.Projects,
                                      MHeight: MHeight,
                                      MWidth: MWidth,
                                      heading: 'Experience',
                                    )
                                  : i == 'Projects'
                                      ? cardHeading(
                                          list: teacher.Experience,
                                          MHeight: MHeight,
                                          MWidth: MWidth,
                                          heading: 'Projects',
                                        )
                                      : i == 'Distinction'
                                          ? cardHeading(
                                              list: teacher.Distinction,
                                              MHeight: MHeight,
                                              MWidth: MWidth,
                                              heading: 'Distinction',
                                            )
                                          : cardHeading(
                                              list: teacher.Research,
                                              MHeight: MHeight,
                                              MWidth: MWidth,
                                              heading: 'Research',
                                            ));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
