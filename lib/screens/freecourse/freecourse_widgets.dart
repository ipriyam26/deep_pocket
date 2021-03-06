// ignore_for_file: camel_case_types, non_constant_identifier_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';


import 'package:deep_pocket_1/models/course_read.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:deep_pocket_1/screens/freecourse/course_list.dart';
import 'package:deep_pocket_1/screens/freecourse/course_screen.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourse_mock.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import 'catagory_model.dart';

class courseButton extends StatelessWidget {
  const courseButton({Key? key, 
    required this.courses,
  }) : super(key: key);

  final Catagory courses;

  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.black,
      onTap: () {
        Navigator.pushNamed(context, courseList.route, arguments: courses.Path);
      },
      child: Card(
        // color: const Color(0xff8ac4ff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Stack(
          children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            placeholder: (context, url) =>
                const CupertinoActivityIndicator(),
            imageUrl: courses.Image,
            height: MSize.height * 0.20,
            width: MSize.width * 0.435,
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          // color: Colors.pink,
          height: MSize.height * 0.20,
          width: MSize.width * 0.435,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(bottom: MSize.height * 0.01),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            width: MSize.width * 0.435,
            child: AutoSizeText(
              courses.Name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
              maxFontSize: 22,
              minFontSize: 20,
              maxLines: 2,
            ),
          ),
        )
          ],
        ),
      ),
    );
  }
}

class courseListCard extends StatelessWidget {
  const courseListCard({Key? key, required this.course}) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.black,
      onTap: () {
        Navigator.pushNamed(context, courseScreen.route, arguments: course);
      },
      child: Card(
        color: const Color.fromRGBO(40, 40, 40, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: SizedBox(
          height: MSize.height * 0.13,
          width: MSize.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image.network(
                  course.image ??
                      "https://pngimg.com/uploads/question_mark/question_mark_PNG122.png",
                  fit: BoxFit.cover,
                  height: MSize.height * 0.13,
                  width: MSize.height * 0.15,
                  // color: const Color(0xff00A6A6),
                ),
              ),
              // const VerticalDivider(
              //   indent: 10,
              //   endIndent: 10,
              //   color: Colors.grey,
              // ),
              Container(
                width: MSize.width * 0.65,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      course.name!,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                      minFontSize: 12,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          course.level ?? "Not Defined",
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Text(
                          '${course.rating ?? 4}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: MSize.width * 0.03,
                        ),
                        const Icon(
                          Icons.fiber_manual_record_rounded,
                          size: 12,
                          color: Colors.grey,
                        ),
                        if (course.enrolled != null)
                          course.enrolled.toString().contains("enrolled")
                              ? AutoSizeText(
                                  course.enrolled.toString().split(" ")[0] +
                                      " " +
                                      course.enrolled.toString().split(" ")[2],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                )
                              : !course.enrolled.toString().contains("After")
                                  ? course.courseLink
                                          .toString()
                                          .contains("classcentral")
                                      ? AutoSizeText(
                                          "${int.parse(course.enrolled.toString().split(".")[0]) * 1200}"   " enrolled",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        )
                                      : course.enrolled
                                              .toString()
                                              .contains("minutes")
                                          ? const Text("")
                                          : AutoSizeText(
                                              course.enrolled.toString() +
                                                  " " +
                                                  "enrolled",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            )
                                  : AutoSizeText(
                                      (Random().nextInt(20000) + 50000)
                                              .toString() +
                                          " " +
                                          "enrolled",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class instructureCard extends StatelessWidget {
  const instructureCard({required this.MHeight, required this.instructoR});

  final double MHeight;
  final List<instructor> instructoR;

  @override
  Widget build(BuildContext context) {
    final MWidth = MediaQuery.of(context).size.width;
    return Card(
      color: const Color(0xffd2b88b),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MWidth * 0.01, vertical: MHeight * 0.01),
        child: Column(
          children: [
            Text(
              "Instructures".toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MHeight * 0.44,
              child: ListView.builder(
                  itemCount: instructoR.length,
                  itemBuilder: (context, i) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xfffbe9d7)),
                        margin:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        // color: Colors.amber,
                        child: ListTile(
                          horizontalTitleGap:
                              MediaQuery.of(context).size.width * 0.02,
                          contentPadding: const EdgeInsets.all(2),
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: MHeight * 0.03,
                            child: ClipRRect(
                              child: Image.network(
                                instructoR[i].image,
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          title: Text(
                            instructoR[i].Name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(instructoR[i].Designation),
                          isThreeLine: false,
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}

class reviewCard extends StatelessWidget {
  const reviewCard({required this.MHeight, required this.review});

  final double MHeight;
  final List<courseReviews> review;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffd2b88b),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            Text(
              "Reviews".toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MHeight * 0.44,
              child: ListView.builder(
                  itemCount: review.length,
                  itemBuilder: (context, i) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xfffbe9d7)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        // color: Colors.amber,
                        child: ListTile(
                          horizontalTitleGap:
                              MediaQuery.of(context).size.width * 0.02,
                          contentPadding: const EdgeInsets.all(2),
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: MHeight * 0.03,
                            child: ClipRRect(
                              child: Image.network(review[i].image),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          title: Text(review[i].Name),
                          subtitle: Text(review[i].review),
                          isThreeLine: true,
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}

class firstHalf extends StatelessWidget {
  const firstHalf({
    required this.course,
  });
  final Course course;
  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;
    double Mwidth = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.amberAccent,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      height: MHeight * 0.265,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          AutoSizeText(
            course.name!,
            style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            minFontSize: 18,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (course.subCatagory!.toLowerCase() != "others")
            SizedBox(
              height: MHeight * 0.015,
            ),
          if (course.subCatagory!.toLowerCase() != "others")
            AutoSizeText(
              course.subCatagory!,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400),
              minFontSize: 18,
              maxFontSize: 22,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          SizedBox(
            height: MHeight * 0.015,
          ),
          Row(
            children: [
              rating(
                ratin: course.rating * 1.0,
              ),
              SizedBox(
                width: Mwidth * 0.07,
              ),
              levelSytem(level: course.level),
            ],
          ),
          SizedBox(
            height: MHeight * 0.015,
          ),
          if (course.enrolled != null)
            course.enrolled.toString().contains("enrolled")
                ? AutoSizeText(
                    course.enrolled.toString().split(" ")[0] +
                        " " +
                        course.enrolled.toString().split(" ")[2],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
                : !course.enrolled.toString().contains("After")
                    ? course.courseLink.toString().contains("classcentral")
                        ? AutoSizeText(
                            "${int.parse(course.enrolled.toString().split(".")[0]) * 12000}" 
                                " " 
                                "enrolled",
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          )
                        : AutoSizeText(
                            course.enrolled.toString() + " " + "enrolled",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          )
                    : AutoSizeText(
                        (Random().nextInt(20000) + 50000).toString() +
                            " " +
                            "enrolled",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
        ],
      ),
    );
  }
}

class levelSytem extends StatelessWidget {
  const levelSytem({this.level});
  final level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Level: ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        Text(level.toString().split(" ")[0],
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300))
      ],
    );
  }
}

class rating extends StatelessWidget {
  const rating({
    required this.ratin,
  });
  final double ratin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RatingBarIndicator(
            unratedColor: Colors.black,
            rating: ratin,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 25.0,
            direction: Axis.horizontal,
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.height * 0.01,
          // ),
          // Text(
          //   "${ratin} (${(ratingno / 1000).round()}K Ratings)",
          //   style: const TextStyle(color: Colors.black, fontSize: 18),
          // ),
        ],
      ),
    );
  }
}

class enrollCard3 extends StatelessWidget {
  const enrollCard3({
    Key? key,
    required this.MHeight,
    required this.course,
  }) : super(key: key);

  final double MHeight;
  final Course course;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: MHeight * 0.15 * 0.06,
          ),
          Text(
            "???? " + course.enrolled.toString() + " Learners Registered",
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class enrollCard2 extends StatelessWidget {
  const enrollCard2({
    Key? key,
    required this.MHeight,
    required this.Mwidth,
  }) : super(key: key);

  final double MHeight;
  final double Mwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MHeight * 0.50 * 0.1,
        // color: Colors.cyan,
        padding: EdgeInsets.symmetric(vertical: MHeight * 0.02),
        width: double.maxFinite,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: const Color(0xff734B3D)),
            onPressed: () {},
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MHeight * 0.025, horizontal: Mwidth * 0.1),
                child: const Text(
                  "ENROLL NOW",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ))));
  }
}

class enrollCard1 extends StatelessWidget {
  const enrollCard1({
    Key? key,
    required this.MHeight,
    required this.Mwidth,
    required this.course,
  }) : super(key: key);

  final double MHeight;
  final double Mwidth;
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
 
        Text(
          "Describtion".toUpperCase(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MHeight * 0.15 * 0.05,
        ),
        Container(
          padding: EdgeInsets.all(Mwidth * 0.03),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xfffbe9d7)),
          child: AutoSizeText(
            course.desciption!,
            style: const TextStyle(fontSize: 14),
            minFontSize: 8,
            maxLines: 10,
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: MHeight * 0.007),
          child: const Text(
            "Course Content",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),

        Container(
          padding: EdgeInsets.all(Mwidth * 0.03),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xfffbe9d7)),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.source,
                    size: 24,
                  ),
                  SizedBox(
                    width: Mwidth * 0.025,
                  ),
                  Text(
                    course.source!,
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: MHeight * 0.15 * 0.02,
              ),

              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    size: 24,
                  ),
                  SizedBox(
                    width: Mwidth * 0.025,
                  ),
                  SizedBox(
                    width: Mwidth * 0.69,
                    child: AutoSizeText(
                      course.time!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MHeight * 0.15 * 0.02,
              ),
              // if (course.quiz != 0)
              Row(
                children: [
                  const Icon(
                    Icons.monetization_on,
                    size: 24,
                  ),
                  SizedBox(
                    width: Mwidth * 0.025,
                  ),
                  Text(course.audit!, style: const TextStyle(fontSize: 16))
                ],
              ),
              SizedBox(
                height: MHeight * 0.15 * 0.02,
              ),

              Row(
                children: [
                  const Icon(
                    Icons.receipt,
                    size: 24,
                  ),
                  SizedBox(
                    width: Mwidth * 0.025,
                  ),
                  Text(course.certificate.toString(),
                      style: const TextStyle(fontSize: 16))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
