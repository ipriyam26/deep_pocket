import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/admin.dart';
import 'package:deep_pocket_1/screens/post/edit_post.dart';
import 'package:deep_pocket_1/screens/profile/search_profile_screen.dart';
import 'package:deep_pocket_1/widgets/fullscreen_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import 'package:readmore/readmore.dart';

class postCard extends StatefulWidget {
  final dynamic id;
  final currentuser = FirebaseAuth.instance.currentUser;

  List<dynamic>? LikedBy;

  final bool Anonymous;

  postCard({
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
  }) : super(key: key);

  final dynamic tag;
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
  State<postCard> createState() => _postCardState();
}

class _postCardState extends State<postCard> {
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
    int currentIndex = 0;
    final CarouselController _controller = CarouselController();

    return Card(
      color: const Color.fromRGBO(11, 10, 10, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          // color: Colors.black,
          // height: widget.MHeight * 0.5,
          // width: MWidth * 0.9,

          padding: EdgeInsets.only(
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
                margin: EdgeInsets.symmetric(horizontal: widget.MWidth * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      // height:DeviceSize.height(context),
                      child: ReadMoreText(
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
                    ),
                  ],
                ),
              ),
              if (widget.imagesList.length > 0)
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
                          setState(() {
                            currentIndex = index;
                          });
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
                                  widget.LikedBy!.add(widget.currentuser!.uid);
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
                                MaterialStateProperty.all<Color>(Colors.black)),
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                        label: const Text("")),
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
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    (Anonymous &&
                            roleController.specialAccess!
                                .contains(currentUserId))
                        ? ClipOval(
                            child: Container(
                              height: MWidth * 0.16,
                              width: MWidth * 0.16,
                              color: Colors.grey,
                              child: CachedNetworkImage(
                                placeholder: (context, url) => Container(
                                    child: Image.asset('assets/person.png')),
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
                                  child: Container(
                                      child: Image.asset(
                                    'assets/person.png',
                                    fit: BoxFit.cover,
                                  )),
                                ),
                              )
                            : ClipOval(
                                child: Container(
                                  height: MWidth * 0.16,
                                  width: MWidth * 0.16,
                                  color: Colors.grey,
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => Container(
                                        child:
                                            Image.asset('assets/person.png')),
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
                                    child: AutoSizeText(
                                      name.toString().split(" ")[0],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      maxFontSize: 19,
                                      minFontSize: 18,
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
                            if (roleController.instructor!.contains(AuthorUID))
                              AutoSizeText(
                                "Instructor   ".toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            AutoSizeText(
                              time.toString(),
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
                        style:
                            const TextStyle(color: Colors.pink, fontSize: 12),
                      ),
                      backgroundColor: const Color.fromRGBO(40, 40, 43, 1),
                    ),

                    // This is the type used by the popup menu below.

                    // This menu button widget updates a _selection field (of type ,
                    // not shown here).
                    (AuthorUID == currentUserId) ||
                            roleController.specialAccess!
                                .contains(currentUserId)
                        ? sheet(
                            id: id,
                            imageList: imageList,
                            title: title,
                            tag: tag,
                            body: body,
                          )
                        : SizedBox(width: MWidth * 0.1)
                  ],
                )
              ],
            ),
          );
        });
  }
}

class sheet extends StatefulWidget {
  const sheet(
      {required this.id,
      required this.imageList,
      required this.title,
      required this.body,
      required this.tag});
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
