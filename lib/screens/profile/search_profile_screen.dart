// ignore_for_file: camel_case_types, avoid_unnecessary_containers, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/admin.dart';
import 'package:deep_pocket_1/widgets/search_recent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../models/user_model.dart';

class searchProfileScreen extends StatefulWidget {
  static const route = '/searchProfileScreen';

  const searchProfileScreen({Key? key}) : super(key: key);
  @override
  State<searchProfileScreen> createState() => _searchProfileScreenState();
}

class _searchProfileScreenState extends State<searchProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  Widget build(BuildContext context) {
    String userId = ModalRoute.of(context)!.settings.arguments as String;
    return GetBuilder(
        init: userRoleController(),
        builder: (userRoleController rolecontroller) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
              title: const Text("User Profile"),
            ),
            body: SingleChildScrollView(
              child: Container(
                // height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(userId)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CupertinoActivityIndicator(),
                        ));
                      }
                      if (!snapshot.hasData) {
                        return const Center(
                            child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CupertinoActivityIndicator(),
                        ));
                      }

                      var userdata = snapshot.data!.data();
                      return SingleChildScrollView(
                        child: Container(
                            child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              height: MediaQuery.of(context).size.height * 0.26,
                              child: Column(
                                children: [
                                  userImageName(
                                    name: userdata!['Name'] ?? "Add Name",
                                    Image: userdata['Image'] ??
                                        "https://imgur.com/a/8eGSOON",
                                    enrollmentNo: userdata["enrollmentNo"] ??
                                        "Add Enrollment",
                                    college: userdata['CollegeName'] ??
                                        "Add College",
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.055),
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Points : ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Chip(
                                              backgroundColor: Colors.pink,
                                              label: Text(
                                                userdata['Points'].toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            searchRecent(userdata: userdata),
                          ],
                        )),
                      );
                    }),
              ),
            ),
          );
        });
  }
}

class userImageName extends StatelessWidget {
  const userImageName({
    required this.name,
    required this.Image,
    required this.college,
    required this.enrollmentNo,
  });

  final String name;
  final String Image;
  final String college;
  final String enrollmentNo;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.025,
            right: MediaQuery.of(context).size.height * 0.025,
            top: MediaQuery.of(context).size.height * 0.025,
            bottom: MediaQuery.of(context).size.height * 0.010),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.height * 0.14,
                height: MediaQuery.of(context).size.height * 0.14,
                child: CachedNetworkImage(
                  placeholder: (context, url) => const SizedBox(
                      height: 50, child: CircularProgressIndicator()),
                  imageUrl: Image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            GetBuilder(
                init: userRoleController(),
                builder: (userRoleController roleController) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          minFontSize: 20,
                          maxFontSize: 23,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "EnrollNo. : ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                AutoSizeText(
                                  enrollmentNo,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  maxFontSize: 16,
                                  minFontSize: 14,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Institute : ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  college,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            if (roleController.instructor!.contains(
                                FirebaseAuth.instance.currentUser!.uid))
                              const Chip(
                                  backgroundColor: Colors.black,
                                  label: Text(
                                    "Instructor",
                                    style: TextStyle(color: Colors.white),
                                  ))
                          ],
                        ),
                        // SizedBox(height:MediaQuery.of(context).size.height ,)
                      ],
                    ),
                  );
                })
          ],
        ));
  }
}
