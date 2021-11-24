// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'half_widgets.dart';

class internPage extends StatelessWidget {
  // const courseScreen({Key? key}) : super(key: key);
  static const route = "/interPage/internships";

  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;
    double MWeight = MediaQuery.of(context).size.width;
    QueryDocumentSnapshot<Map<String, dynamic>> internshipc =
        ModalRoute.of(context)!.settings.arguments
            as QueryDocumentSnapshot<Map<String, dynamic>>;
    Map<String, dynamic> internship = internshipc.data();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
          title: Text("Internship"),
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  constraints: BoxConstraints.expand(),
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      firstHalf(internship: internship),
                      middleButton(internship: internship),
                      SizedBox(
                        height: MHeight * 0.005,
                      ),
                      internshipCarosel(
                          MHeight: MHeight,
                          MWidth: MWeight,
                          internship: internship),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white.withOpacity(0.1))),
                          onPressed: () async {
                            final url = internship['Link'].toString();
                            if (await canLaunch(url)) {
                              FirebaseFirestore.instance
                                  .collection("Internships")
                                  .doc(internshipc.id)
                                  .update(
                                      {'Applied': (internship['Applied'] + 1)});
                              await launch(
                                url,
                                forceSafariVC: true,
                                forceWebView: true,
                                enableJavaScript: true,
                              );
                            }
                          },
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
