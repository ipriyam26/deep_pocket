// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/screens/profile/search_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:deep_pocket_1/admin.dart';
import 'package:intl/intl.dart';

class postPoll extends StatelessWidget {
  final dynamic id;
  final currentuser = FirebaseAuth.instance.currentUser;
  final dynamic tag;
  final double MHeight;
  final double MWidth;
  final dynamic name;
  final dynamic AuthorImage;
  final dynamic title;
  final dynamic time;
  final String AuthorUID;
  final bool NotinFeed;
  final dynamic date;
  final bool Anonymous;

  postPoll({
    Key? key,
    required this.AuthorUID,
    required this.MHeight,
    required this.MWidth,
    required this.name,
    required this.AuthorImage,
    required this.title,
    required this.time,
    required this.date,
    required this.tag,
    required this.id,
    required this.NotinFeed,
    required this.Anonymous,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double MWidth = MediaQuery.of(context).size.width;
    double MHeight = MediaQuery.of(context).size.height;
    return Card(
      color: const Color.fromRGBO(11, 10, 10, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: MWidth * 0.02,
                  right: MWidth * 0.02,
                  top: MHeight * 0.01,
                  bottom: MHeight * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  firstColumn(
                    Anonymous: Anonymous,
                    id: id,
                    title: title,
                    tag: tag,
                    AuthorUID: AuthorUID,
                    currentUserId: currentuser!.uid,
                    MWidth: MWidth,
                    name: name,
                    time: time,
                    date: date,
                    AuthorImage: AuthorImage,
                  ),
                  SizedBox(
                    height: MHeight * 0.01,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class firstColumn extends StatelessWidget {
  final String AuthorUID;

  final String currentUserId;

  final String id;
  final String title;
  final bool Anonymous;
  const firstColumn({
    Key? key,
    required this.MWidth,
    required this.name,
    required this.time,
    required this.AuthorImage,
    required this.date,
    required this.tag,
    required this.AuthorUID,
    required this.currentUserId,
    required this.id,
    required this.title,
    required this.Anonymous,
  }) : super(key: key);

  final dynamic date;
  final double MWidth;
  final dynamic name;
  final dynamic time;
  final dynamic AuthorImage;
  final dynamic tag;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: userRoleController(),
        builder: (userRoleController roleController) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  (Anonymous &&
                          roleController.specialAccess!.contains(currentUserId))
                      ? ClipOval(
                          child: Container(
                            height: MWidth * 0.16,
                            width: MWidth * 0.16,
                            color: Colors.grey,
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  Image.asset('assets/personHolder2.gif'),
                              imageUrl: AuthorImage.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Anonymous
                          ? ClipOval(
                              child: Container(
                                height: MWidth * 0.16,
                                width: MWidth * 0.16,
                                color: Colors.grey,
                                child: Image.asset(
                                  'assets/person.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : ClipOval(
                              child: Container(
                                height: MWidth * 0.16,
                                width: MWidth * 0.16,
                                color: Colors.grey,
                                child: CachedNetworkImage(
                                  placeholder: (context, url) =>
                                      Image.asset('assets/person.png'),
                                  imageUrl: AuthorImage.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                  SizedBox(
                    width: MWidth * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (Anonymous)
                              ? const AutoSizeText(
                                  'Anonymous',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  maxFontSize: 19,
                                  minFontSize: 18,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, searchProfileScreen.route,
                                        arguments: AuthorUID);
                                  },
                                  child: Row(
                                    children: [
                                      AutoSizeText(
                                        name.toString().split(" ")[0],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        maxFontSize: 19,
                                        minFontSize: 18,
                                      ),
                                      if (roleController.instructor!
                                          .contains(AuthorUID))
                                        AutoSizeText(
                                          "  Instructor".toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.pink,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                          if (Anonymous &&
                              roleController.specialAccess!
                                  .contains(currentUserId))
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, searchProfileScreen.route,
                                    arguments: AuthorUID);
                              },
                              child: AutoSizeText(
                                "(${name.toString().split(" ")[0]})",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                maxFontSize: 19,
                                minFontSize: 8,
                              ),
                            )
                        ],
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            DateFormat.jm().format(time).toString() +
                                ",  " +
                                DateFormat.MMMd().format(time).toString(),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Chip(
                    label: Text(
                      tag,
                      style: const TextStyle(color: Colors.pink, fontSize: 12),
                    ),
                    backgroundColor: const Color.fromRGBO(40, 40, 43, 1),
                  ),

                  // This is the type used by the popup menu below.

                  // This menu button widget updates a _selection field (of type ,
                  // not shown here).
                  (AuthorUID == currentUserId) ||
                          roleController.specialAccess!.contains(currentUserId)
                      ? sheet(id: id)
                      : SizedBox(width: MWidth * 0.1)
                ],
              )
            ],
          );
        });
  }
}

class sheet extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const sheet({
    required this.id,
  });
  final String id;

  @override
  State<sheet> createState() => _sheetState();
}

class _sheetState extends State<sheet> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert,
        color: Colors.white.withOpacity(0.5),
      ),
      onSelected: (String result) async {
        await FirebaseFirestore.instance
            .collection("Posts")
            .doc(widget.id)
            .delete();
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: "Delete",
          child: TextButton.icon(
              onPressed: null,
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
              label: const Text(
                "Delete",
                style: TextStyle(color: Colors.black),
              )),
        ),
      ],
    );
  }
}
