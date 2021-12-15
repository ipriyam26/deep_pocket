// ignore_for_file: non_constant_identifier_names, camel_case_types, use_key_in_widget_constructors

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/admin.dart';
import 'package:deep_pocket_1/screens/event/event_screen.dart';
import 'package:deep_pocket_1/screens/internship/internship_page.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_screen.dart';
import 'package:deep_pocket_1/screens/post/edit_post.dart';
import 'package:deep_pocket_1/screens/profile/search_profile_screen.dart';
import 'package:deep_pocket_1/widgets/fullscreen_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class internshipPost extends StatefulWidget {
  final dynamic id;
  final currentuser = FirebaseAuth.instance.currentUser;

  List<dynamic>? LikedBy;

  final bool Anonymous;

  internshipPost({
    Key? key,
    required this.AuthorUID,
    required this.MHeight,
    required this.MWidth,
    required this.imagesList,
    required this.name,
    required this.AuthorImage,
    required this.title,
    required this.body,
    required this.time,
    required this.likes,
    required this.comments,
    required this.date,
    required this.tag,
    required this.id,
    required this.LikedBy,
    required this.NotinFeed,
    required this.Anonymous,
    required this.points,
    required this.SpecialID,
  }) : super(key: key);

  final dynamic points;
  final dynamic tag;
  final dynamic SpecialID;
  final double MHeight;
  final double MWidth;
  final List<dynamic> imagesList;
  final dynamic name;
  final dynamic AuthorImage;
  final dynamic title;
  final dynamic body;
  final dynamic time;
  final String AuthorUID;
  dynamic likes;
  final bool NotinFeed;
  final dynamic comments;
  final dynamic date;

  @override
  State<internshipPost> createState() => _internshipPost();
}

class _internshipPost extends State<internshipPost> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    try {
      if (widget.LikedBy!.contains(widget.currentuser!.uid) == true) {
        liked = true;
      }
    } catch (e) {
      liked = false;
    }
    final CarouselController _controller = CarouselController();
    Color randomColor() =>
        Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(0.8);

    return Card(
      color: const Color.fromRGBO(11, 10, 10, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.01,
                    bottom: MediaQuery.of(context).size.width * 0.01,
                    left: MediaQuery.of(context).size.width * 0.04),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: randomColor(),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(2))),
                child: Text(
                  "NEW " + widget.tag.toString().toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                )),
            Container(
              // color: Colors.black,
              // height: widget.MHeight * 0.5,
              // width: MWidth * 0.9,

              margin: EdgeInsets.only(
                  left: widget.MWidth * 0.02,
                  right: widget.MWidth * 0.02,
                  top: widget.MHeight * 0.01,
                  bottom: widget.MHeight * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  firstColumn(
                    Anonymous: widget.Anonymous,
                    id: widget.id,
                    imageList: widget.imagesList,
                    title: widget.title,
                    tag: widget.tag,
                    body: widget.body,
                    AuthorUID: widget.AuthorUID,
                    currentUserId: widget.currentuser!.uid,
                    MWidth: widget.MWidth,
                    name: widget.name,
                    time: widget.time,
                    date: widget.date,
                    AuthorImage: widget.AuthorImage,
                  ),
                  SizedBox(
                    height: widget.MHeight * 0.01,
                  ),
                  Container(
                    width: widget.MWidth,
                    // height: widget.MHeight * 0.1,
                    margin:
                        EdgeInsets.symmetric(horizontal: widget.MWidth * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title.toString(),
                          style: const TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                        ReadMoreText(
                          widget.body.toString(),
                          trimLines: 2,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '..Read More',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                          trimExpandedText: ' Less',
                        ),
                      ],
                    ),
                  ),
                  if (widget.imagesList.isNotEmpty)
                    Container(
                      height: widget.MHeight * 0.33,
                      padding: EdgeInsets.all(widget.MHeight * 0.002),
                      // color: Colors.amber,
                      child: CarouselSlider(
                        carouselController: _controller,
                        options: CarouselOptions(
                            aspectRatio: 4.5 / 3,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              setState(() {});
                            }),
                        items: widget.imagesList
                            .map(
                              (item) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, fullImage.route,
                                      arguments: item.toString());
                                },
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      color: Colors.grey[200],
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(microseconds: 0),
                                        fadeOutDuration:
                                            const Duration(microseconds: 2),
                                        placeholder: (context, url) =>
                                            const CupertinoActivityIndicator(),
                                        imageUrl: item.toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  SizedBox(
                    height: widget.MHeight * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextButton.icon(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white)),
                                onPressed: () async {
                                  liked = !liked;
                                  if (liked) {
                                    await FirebaseFirestore.instance
                                        .collection("Posts")
                                        .doc(widget.id)
                                        .update({
                                      "LikedBy": FieldValue.arrayUnion(
                                          [widget.currentuser!.uid])
                                    });
                                    if (widget.NotinFeed) {
                                      widget.LikedBy!
                                          .add(widget.currentuser!.uid);
                                    }
                                  } else {
                                    await FirebaseFirestore.instance
                                        .collection("Posts")
                                        .doc(widget.id)
                                        .update({
                                      'Likes': widget.likes,
                                      "LikedBy": FieldValue.arrayRemove(
                                          [widget.currentuser!.uid])
                                    });
                                    if (widget.NotinFeed) {
                                      widget.LikedBy!
                                          .remove(widget.currentuser!.uid);
                                    }
                                  }

                                  setState(() {});
                                },
                                icon: liked
                                    ? const Icon(
                                        Icons.thumb_up,
                                        color: Colors.pink,
                                      )
                                    : const Icon(Icons.thumb_up_outlined),
                                label: Text("${widget.LikedBy!.length} Likes")),
                            TextButton.icon(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white)),
                                onPressed: null,
                                icon: const Icon(Icons.comment),
                                label: Text("${widget.comments} Comments")),
                          ],
                        ),
                        TextButton.icon(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white)),
                            onPressed: () async {
                              DocumentSnapshot<Map<String, dynamic>>?
                                  argumentData;
                              if (widget.tag == "Internship") {
                                final data = await FirebaseFirestore.instance
                                    .collection("Internships")
                                    .doc(widget.SpecialID)
                                    .get();

                                argumentData = data;
                                Navigator.pushNamed(context, internPage.route,
                                    arguments: argumentData);
                              } else if (widget.tag == 'Event') {
                                final data = await FirebaseFirestore.instance
                                    .collection("Events")
                                    .doc(widget.SpecialID)
                                    .get();

                                argumentData = data;
                                Navigator.pushNamed(context, eventScreen.route,
                                    arguments: argumentData);
                              } else {
                                final data = await FirebaseFirestore.instance
                                    .collection("Notices")
                                    .doc(widget.SpecialID)
                                    .get();

                                argumentData = data;
                                Navigator.pushNamed(context, noticeScreen.route,
                                    arguments: argumentData);
                              }
                            },
                            icon: const Icon(Icons.double_arrow),
                            label: const Text("CHECKOUT")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class nearbyPost extends StatefulWidget {
  final dynamic id;
  final currentuser = FirebaseAuth.instance.currentUser;

  List<dynamic>? LikedBy;
  List<dynamic>? DislikedBy;

  final bool Anonymous;

  nearbyPost({
    Key? key,
    required this.AuthorUID,
    required this.MHeight,
    required this.MWidth,
    required this.imagesList,
    required this.name,
    required this.AuthorImage,
    required this.title,
    required this.body,
    required this.time,
    required this.likes,
    required this.comments,
    required this.date,
    required this.tag,
    required this.id,
    required this.LikedBy,
    required this.NotinFeed,
    required this.Anonymous,
    required this.points,
    required this.SpecialID,
    required this.DislikedBy,
    required this.nearbyID,
  }) : super(key: key);

  final dynamic points;
  final dynamic tag;
  final dynamic SpecialID;
  final dynamic nearbyID;
  final double MHeight;
  final double MWidth;
  final List<dynamic> imagesList;
  final dynamic name;
  final dynamic AuthorImage;
  final dynamic title;
  final dynamic body;
  final dynamic time;
  final String AuthorUID;
  dynamic likes;
  final bool NotinFeed;
  final dynamic comments;
  final dynamic date;

  @override
  State<nearbyPost> createState() => _nearbyPost();
}

class _nearbyPost extends State<nearbyPost> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    try {
      if (widget.LikedBy!.contains(widget.currentuser!.uid) == true) {
        liked = true;
      }
    } catch (e) {
      liked = false;
    }
    final CarouselController _controller = CarouselController();
    Color randomColor() =>
        Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(0.8);

    return Card(
      color: const Color.fromRGBO(11, 10, 10, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.01,
                    bottom: MediaQuery.of(context).size.width * 0.01,
                    left: MediaQuery.of(context).size.width * 0.04),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: randomColor(),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(2))),
                child: const Text(
                  "NEW USER ADDED PLACE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                )),
            Container(
              margin: EdgeInsets.only(
                  left: widget.MWidth * 0.02,
                  right: widget.MWidth * 0.02,
                  top: widget.MHeight * 0.01,
                  bottom: widget.MHeight * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  firstColumnN(
                    nearbyID: widget.nearbyID,
                    Anonymous: widget.Anonymous,
                    id: widget.id,
                    imageList: widget.imagesList,
                    title: widget.title,
                    tag: widget.tag,
                    body: widget.body,
                    AuthorUID: widget.AuthorUID,
                    currentUserId: widget.currentuser!.uid,
                    MWidth: widget.MWidth,
                    name: widget.name,
                    time: widget.time,
                    date: widget.date,
                    AuthorImage: widget.AuthorImage,
                  ),
                  SizedBox(
                    height: widget.MHeight * 0.01,
                  ),
                  Container(
                    width: widget.MWidth,
                    // height: widget.MHeight * 0.1,
                    margin:
                        EdgeInsets.symmetric(horizontal: widget.MWidth * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title.toString(),
                          style: const TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                        const Text(
                          "@Place will be Automatically added after reaching 50 likes",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        ReadMoreText(
                          widget.body.toString(),
                          trimLines: 2,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '..Read More',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                          trimExpandedText: ' Less',
                        ),
                      ],
                    ),
                  ),
                  if (widget.imagesList.isNotEmpty)
                    Container(
                      height: widget.MHeight * 0.33,
                      padding: EdgeInsets.all(widget.MHeight * 0.002),
                      // color: Colors.amber,
                      child: CarouselSlider(
                        carouselController: _controller,
                        options: CarouselOptions(
                            aspectRatio: 4.5 / 3,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              setState(() {});
                            }),
                        items: widget.imagesList
                            .map(
                              (item) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, fullImage.route,
                                      arguments: item.toString());
                                },
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          const Duration(microseconds: 0),
                                      fadeOutDuration:
                                          const Duration(microseconds: 2),
                                      placeholder: (context, url) =>
                                          Image.asset(
                                              "assets/ImageLoading.gif"),
                                      imageUrl: item.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  SizedBox(
                    height: widget.MHeight * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //Liked Button
                                TextButton.icon(
                                    onPressed: () async {
                                      if (widget.DislikedBy!
                                          .contains(widget.currentuser!.uid)) {
                                        await FirebaseFirestore.instance
                                            .collection("Posts")
                                            .doc(widget.id)
                                            .update({
                                          "DislikedBy": FieldValue.arrayRemove(
                                              [widget.currentuser!.uid])
                                        });
                                      }
                                      await FirebaseFirestore.instance
                                          .collection("Posts")
                                          .doc(widget.id)
                                          .update({
                                        "LikedBy": FieldValue.arrayUnion(
                                            [widget.currentuser!.uid])
                                      });
                                      int total = widget.LikedBy!.length +
                                          widget.DislikedBy!.length;
                                      if (widget.LikedBy!.length > 50 &&
                                          (widget.DislikedBy!.length) / total <
                                              0.1) {
                                        await FirebaseFirestore.instance
                                            .collection("Nearby")
                                            .doc(widget.nearbyID)
                                            .update({"Archived": false});
                                      }
                                      if (widget.LikedBy!.length > 50 &&
                                          (widget.DislikedBy!.length) / total <
                                              0.1) {
                                        await FirebaseFirestore.instance
                                            .collection("Nearby")
                                            .doc(widget.nearbyID)
                                            .update({"Archived": false});
                                      }
                                    },
                                    icon: widget.LikedBy!
                                            .contains(widget.currentuser!.uid)
                                        ? const Icon(
                                            Icons.thumb_up,
                                            color: Colors.pink,
                                          )
                                        : const Icon(
                                            Icons.thumb_up_outlined,
                                            color: Colors.white,
                                          ),
                                    label: Text(
                                      "${widget.LikedBy!.length}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )),
                                //Dislike Button
                                TextButton.icon(
                                    onPressed: () async {
                                      if (widget.LikedBy!
                                          .contains(widget.currentuser!.uid)) {
                                        await FirebaseFirestore.instance
                                            .collection("Posts")
                                            .doc(widget.id)
                                            .update({
                                          "LikedBy": FieldValue.arrayRemove(
                                              [widget.currentuser!.uid])
                                        });
                                      }

                                      await FirebaseFirestore.instance
                                          .collection("Posts")
                                          .doc(widget.id)
                                          .update({
                                        "DislikedBy": FieldValue.arrayUnion(
                                            [widget.currentuser!.uid])
                                      });
                                    },
                                    icon: widget.DislikedBy!
                                            .contains(widget.currentuser!.uid)
                                        ? const Icon(
                                            Icons.thumb_down,
                                            color: Colors.pink,
                                          )
                                        : const Icon(
                                            Icons.thumb_down_outlined,
                                            color: Colors.white,
                                          ),
                                    label: Text(
                                      "${widget.DislikedBy!.length} ",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                            TextButton.icon(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white)),
                                onPressed: null,
                                icon: const Icon(Icons.comment),
                                label: Text("${widget.comments} Comments")),
                          ],
                        ),
                        TextButton.icon(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white)),
                            onPressed: () async {
                              final url = widget.SpecialID.toString();
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  forceSafariVC: true,
                                  forceWebView: true,
                                  enableJavaScript: true,
                                );
                              }
                            },
                            icon: const Icon(Icons.pin_drop),
                            label: const Text("CHECK")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class firstColumn extends StatelessWidget {
  final String AuthorUID;

  final String currentUserId;

  final List<dynamic> imageList;
  final String id;
  final String title;
  final String body;
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
    required this.imageList,
    required this.title,
    required this.body,
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
                  ClipOval(
                    child: Container(
                      height: MWidth * 0.16,
                      width: MWidth * 0.16,
                      color: Colors.grey,
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            Image.asset('assets/personHolder.gif'),
                        imageUrl: AuthorImage,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, searchProfileScreen.route,
                                  arguments: AuthorUID);
                            },
                            child: AutoSizeText(
                              name.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              maxFontSize: 19,
                              minFontSize: 18,
                            ),
                          ),
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
              (AuthorUID == currentUserId) ||
                      roleController.specialAccess!.contains(currentUserId)
                  ? sheet(
                      id: id,
                      imageList: imageList,
                      title: title,
                      tag: tag,
                      body: body,
                    )
                  : SizedBox(width: MWidth * 0.1)
            ],
          );
        });
  }
}

class firstColumnN extends StatelessWidget {
  final String AuthorUID;

  final String currentUserId;

  final List<dynamic> imageList;
  final String id;
  final String title;
  final String body;
  final bool Anonymous;

  final dynamic nearbyID;

  const firstColumnN({
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
    required this.imageList,
    required this.title,
    required this.body,
    required this.Anonymous,
    required this.nearbyID,
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
                  ClipOval(
                    child: Container(
                      height: MWidth * 0.16,
                      width: MWidth * 0.16,
                      color: Colors.grey,
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            Image.asset('assets/person.png'),
                        imageUrl: AuthorImage,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, searchProfileScreen.route,
                                  arguments: AuthorUID);
                            },
                            child: AutoSizeText(
                              name.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              maxFontSize: 19,
                              minFontSize: 18,
                            ),
                          ),
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
              roleController.specialAccess!.contains(currentUserId)
                  ? sheetN(
                      id: id,
                      imageList: imageList,
                      title: title,
                      body: body,
                      tag: tag,
                      nearbyID: nearbyID)
                  : SizedBox(width: MWidth * 0.1)
            ],
          );
        });
  }
}

class sheet extends StatefulWidget {
  const sheet({
    required this.id,
    required this.imageList,
    required this.title,
    required this.body,
    required this.tag,
  });
  final List<dynamic> imageList;
  final String id;
  final String title;
  final String body;
  final String tag;

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
        result == 'Edit'
            ? Navigator.pushNamed(context, editPost.route, arguments: {
                "id": widget.id,
                "title": widget.title,
                "imageList": widget.imageList,
                "body": widget.body,
                "tag": widget.tag,
              })
            : await FirebaseFirestore.instance
                .collection("Posts")
                .doc(widget.id)
                .delete();
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: "Edit",
          child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.edit),
              label: const Text("Edit", style: TextStyle(color: Colors.black))),
        ),
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

class sheetN extends StatefulWidget {
  const sheetN(
      {required this.id,
      required this.imageList,
      required this.title,
      required this.body,
      required this.tag,
      required this.nearbyID});
  final List<dynamic> imageList;
  final String id;
  final String title;
  final String body;
  final String tag;
  final String nearbyID;

  @override
  State<sheetN> createState() => _sheetNState();
}

class _sheetNState extends State<sheetN> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert,
        color: Colors.white.withOpacity(0.5),
      ),
      onSelected: (String result) async {
        result == 'Edit'
            ? Navigator.pushNamed(context, editPost.route, arguments: {
                "id": widget.id,
                "title": widget.title,
                "imageList": widget.imageList,
                "body": widget.body,
                "tag": widget.tag,
              })
            : result == 'ADD'
                ? await FirebaseFirestore.instance
                    .collection("Nearby")
                    .doc(widget.nearbyID)
                    .update({"Archived": false})
                : await FirebaseFirestore.instance
                    .collection("Posts")
                    .doc(widget.id)
                    .delete();
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: "ADD",
          child: TextButton.icon(
              onPressed: null,
              icon: const Icon(
                Icons.add_location_alt,
                color: Colors.pink,
              ),
              label:
                  const Text("ADD NOW", style: TextStyle(color: Colors.black))),
        ),
        PopupMenuItem(
          value: "Edit",
          child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.edit),
              label: const Text("Edit", style: TextStyle(color: Colors.black))),
        ),
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
