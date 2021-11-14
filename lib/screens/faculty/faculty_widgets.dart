import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deep_pocket_1/screens/faculty/faculty_page.dart';
import 'package:deep_pocket_1/screens/faculty/faculty_screen.dart';
import 'package:deep_pocket_1/screens/faculty/school_screen.dart';
import 'package:flutter/material.dart';

import 'faculty_model.dart';

class cardHeading extends StatelessWidget {
  // const cardHeading({Key? key}) : super(key: key);
  final List<String> list;
  final String heading;
  final double MWidth;
  final double MHeight;
  cardHeading({
    required this.list,
    required this.MHeight,
    required this.MWidth,
    required this.heading,
    // ignore: non_constant_identifier_names
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MHeight * 0.01,
        ),
        Text(
          heading,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MHeight * 0.01,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MWidth * 0.05),
          padding: EdgeInsets.all(MHeight * 0.01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF2EEB3)),
          height:
              min(MHeight * 0.05 * list.length + MHeight * 0.05, MHeight * 0.4),
          child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: MHeight * 0.005),
              itemCount: list.length,
              itemBuilder: (context, i) => Text(
                    list[i],
                    style: TextStyle(fontSize: 18),
                  )),
        )
      ],
    );
  }
}

class NameAndStuff extends StatelessWidget {
  const NameAndStuff({
    Key? key,
    required this.MWidth,
    required this.MHeight,
    required this.teacher,
  }) : super(key: key);

  final double MWidth;
  final double MHeight;
  final Faculty_model teacher;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // color: Colors.amber,
        padding: EdgeInsets.only(
            left: MWidth * 0.05, right: MWidth * 0.05, top: MHeight * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.amber,
              width: MWidth * 0.99,
              child: AutoSizeText(
                teacher.Name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
                maxLines: 2,
                maxFontSize: 35,
                minFontSize: 30,
              ),
            ),
            SizedBox(
              height: MHeight * 0.01,
            ),
            if (teacher.Designation != 'null')
              Row(
                children: [
                  Icon(Icons.verified, color: Colors.blue),
                  SizedBox(
                    width: MWidth * 0.02,
                  ),
                  Container(
                      // color: Colors.amber,
                      width: MWidth * 0.77,
                      child: Text(teacher.Designation))
                ],
              ),
            SizedBox(
              height: MHeight * 0.01,
            ),
            if (teacher.School != 'null')
              Chip(
                  label: Text(
                    teacher.School,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red),
            if (teacher.Department != 'null')
              Chip(
                  label: Text(
                    teacher.Department,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.blue),
            SizedBox(
              height: MHeight * 0.01,
            ),
            if (teacher.About.isNotEmpty && teacher.About != 'null')
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MWidth * 0.03, vertical: MHeight * 0.02),
                child: AutoSizeText(
                  teacher.About,
                  style: TextStyle(color: Colors.black),
                  minFontSize: 8,
                  maxFontSize: 15,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF2EEB3)),
              )
          ],
        ),
      ),
    );
  }
}

class deansCard extends StatelessWidget {
  deansCard(
      {Key? key,
      required this.MWidth,
      required this.MHeight,
      required this.head,
      this.headingSize = 19,
      required this.heading});

  final double MWidth;
  final double MHeight;
  final String heading;
  double headingSize;
  final List<Faculty_model> head;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
              left: MWidth * 0.05,
              top: MHeight * 0.01,
              bottom: MHeight * 0.005),
          child: Text(
            heading,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: headingSize),
          ),
        ),
        Container(
          // color: Colors.amber,
          height: MHeight * 0.167 * (head.length / 3).ceilToDouble(),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: head.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: MHeight * 0.005,
                  childAspectRatio: 0.95,
                  crossAxisCount: 3),
              itemBuilder: (context, i) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, facultyPage.route,
                          arguments: head[i]);
                    },
                    splashColor: Colors.black,
                    child: Card(
                      // color: Color(0xffF1FFB0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(MWidth * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Hero(
                              tag: head[i].profile,
                              child: Container(
                                child: ClipOval(
                                  child: Container(
                                    height: MWidth * 0.2,
                                    width: MWidth * 0.2,
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => Container(
                                          height: MWidth * 0.1,
                                          width: MWidth * 0.1,
                                          child:
                                              const CircularProgressIndicator(
                                            color: Colors.grey,
                                          )),
                                      imageUrl: head[i].Image,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Divider(),

                            SizedBox(
                              // color: Colors.amber,
                              width: MWidth * 0.27,
                              child: AutoSizeText(
                                head[i].Name,
                                textAlign: TextAlign.center,
                                // style: TextStyle(fontSize: 12),
                                minFontSize: 6,
                                maxLines: 2,
                                maxFontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}

class cardList extends StatelessWidget {
  const cardList({
    Key? key,
    required this.MWidth,
    required this.MHeight,
    required this.sch,
  }) : super(key: key);

  final double MWidth;
  final double MHeight;
  final school sch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      onTap: () {
        Navigator.pushNamed(
          context,
          schoolScreen.route,
          arguments: sch.name,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: MWidth * 0.025),
        margin: EdgeInsets.symmetric(
            horizontal: MHeight * 0.01, vertical: MHeight * 0.007),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // color: Colors.pink,

                height: MHeight * 0.15,
                width: MHeight * 0.15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                        height: MHeight * 0.02,
                        child: const CircularProgressIndicator()),
                    imageUrl: sch.Image,
                  ),
                )),
            Container(
                alignment: Alignment.centerLeft,
                // color: Colors.amber,
                height: MHeight * 0.18,
                width: MWidth * 0.53,
                child: Text(
                  sch.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }
}
