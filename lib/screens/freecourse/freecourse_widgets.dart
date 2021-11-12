import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:deep_pocket_1/models/freecourses_models.dart';
import 'package:deep_pocket_1/screens/freecourse/course_list.dart';
import 'package:deep_pocket_1/screens/freecourse/course_screen.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourse_mock.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class courseButton extends StatelessWidget {
  // const courseButton({
  // Key? key,
  courseButton({
    required this.courses,
    // required this.i,
  });
  // }) : super(key: key);

  final freecourses_models courses;
  // final i;
  // final Msize;

  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    final number = mockCourse().mockcourse.where((element) {
      if (courses.Name == element.field) {
        return true;
      }
      return false;
    }).length;
    return InkWell(
      splashColor: Colors.black,
      onTap: () {
        Navigator.pushNamed(context, courseList.route, arguments: courses.Name);
      },
      child: Card(
        // color: const Color(0xff8ac4ff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Container(
            // color: Colors.amber,
            // decoration: BoxDecoration(border: Border.all()),
            // height: MSize.height * 0.2,
            // width: MSize.height * 0.2,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              courses.imgsrc,
              height: MSize.height * 0.1,
              width: MSize.height * 0.1,
              color: const Color(0xff00A6A6),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              courses.Name,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 7,
            ),
            AutoSizeText(
              number.toString() + " courses",
              style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff696767),
                  fontWeight: FontWeight.w500),
            )
          ],
        )),
      ),
    );
  }
}

class courseListCard extends StatelessWidget {
  courseListCard({required this.course});
  final courseMock course;
  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.black,
      onTap: () {
        Navigator.pushNamed(context, courseScreen.route, arguments: course);
      },
      child: Card(
        // color: Color(0xfffac4d9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Container(
          height: MSize.height * 0.13,
          width: MSize.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // color: Colors.amber,
                padding: EdgeInsets.only(
                    left: MSize.width * 0.02, right: MSize.width * 0.01),
                child: Image.network(
                  course.image,
                  fit: BoxFit.contain,
                  height: MSize.height * 0.11,
                  width: MSize.height * 0.11,
                  // color: const Color(0xff00A6A6),
                ),
              ),
              const VerticalDivider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
              ),
              Container(
                width: MSize.width * 0.65,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      course.name,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      minFontSize: 12,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          skillLevel[course.skillLevel],
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          width: MSize.width * 0.03,
                        ),
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 16,
                          color: Colors.grey,
                        ),
                        Text(" " + course.hours.toString() + " hr",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey)),
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
                          '${course.rating} (${(course.ratingNo / 1000).round()}k)',
                          style: const TextStyle(
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
                        Text(
                          course.enrolled.toStringAsFixed(2) + " Enrolled",
                          style: const TextStyle(
                            fontSize: 12,
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
  instructureCard({required this.MHeight, required this.instructoR});

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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        // color: Colors.amber,
                        child: ListTile(
                          horizontalTitleGap:
                              MediaQuery.of(context).size.width * 0.02,
                          contentPadding: EdgeInsets.all(2),
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
                            style: TextStyle(fontWeight: FontWeight.w600),
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
  reviewCard({required this.MHeight, required this.review});

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
                          contentPadding: EdgeInsets.all(2),
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
  firstHalf({
    required this.course,
  });
  final courseMock course;
  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;

    return Container(
      // color: Colors.amberAccent,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      height: MHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            // padding: EdgeInsets.all(10),
            child: AutoSizeText(
              course.name,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              minFontSize: 18,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: MHeight * 0.015,
          ),
          rating(
            ratin: course.rating,
            ratingno: course.ratingNo,
          ),
          SizedBox(
            height: MHeight * 0.01,
          ),
          levelSytem(level: course.skillLevel)
        ],
      ),
    );
  }
}

class levelSytem extends StatelessWidget {
  levelSytem({this.level});
  final level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Level: ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        Text(skillLevel[level],
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300))
      ],
    );
  }
}

class rating extends StatelessWidget {
  rating({required this.ratin, required this.ratingno});
  final double ratin;
  final int ratingno;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            "${ratin} (${(ratingno / 1000).round()}K Ratings)",
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
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
  final courseMock course;

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
            "👁 ${(course.enrolled * 1000).round()} Learners Registered",
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
  final courseMock course;

  @override
  Widget build(BuildContext context) {
    return Container(
      //This area is used for Top Part Started
      // color: Colors.amber,
      // height: MHeight * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: MHeight * 0.15 * 0.14,
          // ),
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
              course.description,
              style: const TextStyle(fontSize: 14),
              minFontSize: 7,
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
                      Icons.watch_later_outlined,
                      size: 24,
                    ),
                    Text(
                      "  ${course.hours.round()} Hrs of video content",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: MHeight * 0.15 * 0.02,
                ),
                if (course.quiz != 0)
                  Row(
                    children: [
                      const Icon(
                        Icons.bolt,
                        size: 24,
                      ),
                      Text("  ${course.quiz} Quiz",
                          style: const TextStyle(fontSize: 16))
                    ],
                  ),
                SizedBox(
                  height: MHeight * 0.15 * 0.02,
                ),
                if (course.projects != 0)
                  Row(
                    children: [
                      const Icon(
                        Icons.lightbulb_outline,
                        size: 24,
                      ),
                      Text("  ${course.projects} Projects",
                          style: const TextStyle(fontSize: 16))
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
