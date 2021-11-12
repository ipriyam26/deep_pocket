// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

import 'half_widgets.dart';

class internPage extends StatelessWidget {
  // const courseScreen({Key? key}) : super(key: key);
  static const route = "/interPage/internships";

  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;
    double MWeight = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Internship"),
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
                      Color.fromRGBO(0, 0, 128, 0.4),
                      Color.fromRGBO(30, 144, 255, 0.95),
                      Color.fromRGBO(135, 206, 250, 1),
                    ],
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      firstHalf(),
                      middleButton(),
                      SizedBox(
                        height: MHeight * 0.005,
                      ),
                      internshipCarosel(
                        MHeight: MHeight,
                        MWidth: MWeight,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: MWeight * 0.28),
                            child: Text(
                              "APPLY",
                              style: TextStyle(fontSize: 18),
                            ),
                          ))
                    ],
                  ))
            ],
          ),
        ));
  }
}
