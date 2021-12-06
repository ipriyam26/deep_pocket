// ignore_for_file: camel_case_types

import 'package:deep_pocket_1/screens/club/clubs_screen.dart';
import 'package:deep_pocket_1/screens/event/even_tabs.dart';

// import 'package:deep_poc_1ket/screens/event/events_screen.dart';
import 'package:deep_pocket_1/screens/faculty/faculty_screen.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourses_screen.dart';
import 'package:deep_pocket_1/screens/internship/interships_screen.dart';
import 'package:deep_pocket_1/screens/noticeboard/notiboard_home.dart';
import 'package:deep_pocket_1/screens/resources/resources_tab_screen.dart';
import 'package:flutter/material.dart';

class menuButtons extends StatelessWidget {
  const menuButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.lightBlue,
            padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: const Text(
              "MENU",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 200,
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1.0),
              children: const [
                IconButton(
                  loc: 'assets/employee.png',
                  title: 'INTERNSHIPS',
                  routeName: internShips.route,
                ),
                IconButton(
                    loc: 'assets/club.png',
                    title: 'CLUBS',
                    routeName: clubsScreen.route),
                IconButton(
                    loc: 'assets/event.png',
                    title: 'EVENTS',
                    routeName: eventTabs.route),
                IconButton(
                    loc: 'assets/map.png',
                    title: 'NEARBY',
                    routeName: internShips.route),
                IconButton(
                    loc: 'assets/noticeboard.png',
                    title: 'NOTICE',
                    routeName: noticeBoard.route),
                IconButton(
                    loc: 'assets/school.png',
                    title: 'FACULTY',
                    routeName: facultyScreen.route),
                IconButton(
                    loc: 'assets/open-book.png',
                    title: 'RESOURCES',
                    routeName: resourcesTab.route),
                IconButton(
                    loc: 'assets/online-course.png',
                    title: 'FREE COURSE',
                    routeName: freeCources.route)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  const IconButton({
    Key? key,
    required this.loc,
    required this.title,
    required this.routeName,
  }) : super(key: key);

  final String loc;
  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(0.8),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.blue,
            width: 1,
          )),
          child: Container(
            margin: const EdgeInsets.all(0.2),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue, width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  loc,
                  width: 40,
                  height: 40,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
