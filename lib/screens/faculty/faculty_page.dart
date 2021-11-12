import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:deep_pocket_1/screens/faculty/faculty_model.dart';
import 'faculty_widgets.dart';

class facultyPage extends StatelessWidget {
  static const route = '/school-screen/faculty-screen/faculty-page';
  @override
  Widget build(BuildContext context) {
    List<String> pageN = ['bio'];
    final teacher = ModalRoute.of(context)!.settings.arguments as Faculty_model;
    final MWidth = MediaQuery.of(context).size.width;
    final MHeight = MediaQuery.of(context).size.height;

    if (teacher.Education.length != 0) {
      pageN.add('Education');
    }
    if (teacher.Experience.length != 0) {
      pageN.add('Experience');
    }
    if (teacher.Projects.length != 0) {
      pageN.add('Projects');
    }
    if (teacher.Distinction.length != 0) {
      pageN.add('Distinction');
    }
    if (teacher.Research.length != 0) {
      pageN.add('Research');
    }

    return Scaffold(
      // backgroundColor: Colors.brown,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MHeight * 0.034,
          ),
          Hero(
            tag: teacher.profile,
            child: Container(
              height: MWidth,
              width: MWidth,
              decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  image: DecorationImage(
                      image: NetworkImage(
                        teacher.Image,
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          Container(
            child: CarouselSlider(
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
            ),
          )
        ],
      ),
    );
  }
}
