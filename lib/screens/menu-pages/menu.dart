// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:deep_pocket_1/screens/Nearby/nearby_tab.dart';
import 'package:deep_pocket_1/screens/club/clubs_screen.dart';
import 'package:deep_pocket_1/screens/event/even_tabs.dart';
import 'package:deep_pocket_1/screens/faculty/faculty_screen.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourses_screen.dart';
import 'package:deep_pocket_1/screens/internship/interships_screen.dart';

import 'package:deep_pocket_1/screens/noticeboard/notice_tab.dart';
import 'package:deep_pocket_1/screens/resources/resources_tab_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mbutton {
  final String image;
  final String name;
  final String route;

  mbutton({
    required this.name,
    required this.image,
    required this.route,
  });
}

class MenuP extends StatelessWidget {
  // Color randomColor() =>
  //     Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  List<mbutton> menu = [
    mbutton(
        name: "INTERNSHIPS",
        image: "https://i.imgur.com/aIzUbSs.jpeg",
        route: internShips.route),
    mbutton(
        name: "EVENTS",
        image:
            "https://t3.ftcdn.net/jpg/03/32/31/96/240_F_332319626_8JB5rN3WmHEunZ1PkJBMjva3sH5Rxe0v.jpg",
        route: eventTabs.route),
    mbutton(
        name: "CLUBS",
        image:
            "https://t4.ftcdn.net/jpg/04/53/25/87/240_F_453258736_SpoLU2Kw2Xuo18B3mhnxB2D9AUjyFHoJ.jpg",
        route: clubsScreen.route),
    mbutton(
        name: "NEARBY",
        image:
            "https://as2.ftcdn.net/v2/jpg/02/07/31/27/1000_F_207312782_UAsvH6A9GteuXrkPQPGBSNDGxDuSYLVt.jpg",
        route: nearbyTab.route),
    mbutton(
        name: "NOTICE",
        image:
            "https://as2.ftcdn.net/v2/jpg/03/97/68/63/1000_F_397686319_bzfypCKI13uWJetS60FB4EiDHzExJasl.jpg",
        route: NoticeTab.route),
    mbutton(
        name: "FACULTY",
        image: "https://i.imgur.com/73GGpnzh.jpg",
        route: facultyScreen.route),
    mbutton(
        name: "RESOURCES",
        image: "https://i.imgur.com/MPVepKlh.jpg",
        route: resourcesTab.route),
    mbutton(
        name: "COURSES",
        image: "https://i.imgur.com/smD7BFCh.jpg",
        route: freeCources.route)
  ];

  MenuP({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Mheight = MediaQuery.of(context).size.height;
    final Mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
      body: SafeArea(
          child: SizedBox(
        height: Mheight * 0.22,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: Mwidth * 0.02),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 4,
                childAspectRatio: 5 / 4.8),
            itemCount: menu.length,
            itemBuilder: (context, i) => Menubtt(
                  Mwidth: Mwidth,
                  Mheight: Mheight,
                  image: menu[i].image,
                  name: menu[i].name,
                  route: menu[i].route,
                )),
      )

          // Menubtt(
          //     Mwidth: Mwidth, Mheight: Mheight, image: image, name: name),
          ),
    );
  }
}

class Menubtt extends StatelessWidget {
  const Menubtt({
    Key? key,
    required this.Mwidth,
    required this.Mheight,
    required this.image,
    required this.name,
    required this.route,
  }) : super(key: key);

  final double Mwidth;
  final double Mheight;
  final String image;
  final String name;
  final String route;
  Color randomColor() =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        color: randomColor(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: SizedBox(
          height: Mheight * 0.08,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: CachedNetworkImage(
                    fadeInDuration: const Duration(microseconds: 0),
                    fadeOutDuration: const Duration(microseconds: 0),
                    placeholder: (context, url) => const SizedBox(
                        height: 50,
                        width: 50,
                        child: CupertinoActivityIndicator()),
                    imageUrl: image,
                    height: Mheight * 0.075,
                    width: Mwidth * 0.225,
                    fit: BoxFit.fill),
              ),
              SizedBox(
                height: Mheight * 0.002,
              ),
              AutoSizeText(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Colors.white),
                minFontSize: 11,
                maxFontSize: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
