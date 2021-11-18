import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/admin.dart';
import 'package:deep_pocket_1/screens/profile/edit_profile.dart';

import 'package:deep_pocket_1/widgets/recent_about.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../models/user_model.dart';

class profileScreen extends StatefulWidget {
  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: userRoleController(),
        builder: (userRoleController rolecontroller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
              actions: [
                if (rolecontroller.admins!.contains(user!.uid))
                  const Chip(
                    label: Text(
                      "Admin",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.pink,
                  ),
              ],
              title: const Text("User Profile"),
            ),
            body: SingleChildScrollView(
              child: Container(
                // height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(user!.uid)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: Container(
                          height: 50,
                          width: 50,
                          child: const CupertinoActivityIndicator(),
                        ));
                      }
                      if (!snapshot.hasData) {
                        return Center(
                            child: Container(
                          height: 50,
                          width: 50,
                          child: const CupertinoActivityIndicator(),
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
                                  border: Border.all(color: Colors.grey)),
                              height: MediaQuery.of(context).size.height * 0.27,
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
                                  editprofile(),
                                ],
                              ),
                            ),
                            RecentAbout(userdata: userdata),
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

class editprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          width: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(primary: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, editProfile.route);
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.pink,
            ),
            label: const Text(
              "Edit Profile",
              // style: TextStyle(color: Colors.pink),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.share))
      ],
    ));
  }
}

class userImageName extends StatelessWidget {
  userImageName({
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
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.height * 0.14,
                height: MediaQuery.of(context).size.height * 0.14,
                child: CachedNetworkImage(
                  placeholder: (context, url) => Container(
                      height: 50, child: const CircularProgressIndicator()),
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
                      children: [
                        AutoSizeText(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
                                  ),
                                ),
                                AutoSizeText(
                                  enrollmentNo,
                                  style: const TextStyle(),
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
                                  ),
                                ),
                                Text(
                                  college,
                                  style: const TextStyle(
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
