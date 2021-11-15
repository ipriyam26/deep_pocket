import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';

class postCard extends StatefulWidget {
  final dynamic id;
  final currentuser = FirebaseAuth.instance.currentUser;

  List<dynamic>? LikedBy;

  postCard({
    Key? key,
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
  dynamic likes;
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

    return Card(
      child: Container(
        // color: Colors.amberAccent,
        // height: widget.MHeight * 0.5,
        // width: MWidth * 0.9,
        margin: EdgeInsets.symmetric(
            horizontal: widget.MWidth * 0.01, vertical: widget.MHeight * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            firstColumn(
                MWidth: widget.MWidth,
                name: widget.name,
                time: widget.time,
                date: widget.date,
                AuthorImage: widget.AuthorImage,
                tag: widget.tag),
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
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
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
                      style: const TextStyle(fontSize: 13),
                      trimExpandedText: ' Less',
                    ),
                  ),
                ],
              ),
            ),
            if (widget.imagesList.length > 0)
              Container(
                height: widget.MHeight * 0.28,
                padding: EdgeInsets.all(widget.MHeight * 0.005),
                // color: Colors.amber,
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 4.5 / 3,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                  ),
                  items: widget.imagesList
                      .map(
                        (item) => Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: Colors.grey[200],
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(microseconds: 0),
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
                      )
                      .toList(),
                ),
              ),
            Container(
              height: widget.MHeight * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton.icon(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                          onPressed: () async {
                            liked = !liked!;
                            if (liked!) {
                              widget.likes += 1;
                              await FirebaseFirestore.instance
                                  .collection("Posts")
                                  .doc(widget.id)
                                  .update({
                                'Likes': widget.likes,
                                "LikedBy": FieldValue.arrayUnion(
                                    [widget.currentuser!.uid])
                              });
                            } else {
                              widget.likes -= 1;
                              await FirebaseFirestore.instance
                                  .collection("Posts")
                                  .doc(widget.id)
                                  .update({
                                'Likes': widget.likes,
                                "LikedBy": FieldValue.arrayRemove(
                                    [widget.currentuser!.uid])
                              });
                            }
                            setState(() {});
                          },
                          icon: liked!
                              ? const Icon(
                                  Icons.thumb_up,
                                  color: Colors.pink,
                                )
                              : const Icon(Icons.thumb_up_outlined),
                          label: Text("${widget.likes} Likes")),
                      TextButton.icon(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
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
    );
  }
}

class firstColumn extends StatelessWidget {
  const firstColumn({
    Key? key,
    required this.MWidth,
    required this.name,
    required this.time,
    required this.AuthorImage,
    required this.date,
    required this.tag,
  }) : super(key: key);

  final dynamic date;
  final double MWidth;
  final dynamic name;
  final dynamic time;
  final dynamic AuthorImage;
  final dynamic tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipOval(
            child: Container(
              height: MWidth * 0.15,
              width: MWidth * 0.15,
              color: Colors.grey,
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    Container(child: Image.asset('assets/person.png')),
                imageUrl: AuthorImage.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ClipOval(
          //   child: Container(
          //     width: MWidth * 0.15,
          //     height: MWidth * 0.15,
          //     decoration: BoxDecoration(
          //       color: Colors.grey,
          //       image: DecorationImage(
          //         image: NetworkImage(
          //           AuthorImage.toString(),
          //         ),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          //   //      Image.network(
          //   //   AuthorImage.toString(),
          //   //   width: MWidth * 0.15,
          //   //   height: MWidth * 0.15,
          //   //   fit: BoxFit.cover,
          //   // )
          // ),

          SizedBox(
            width: MWidth * 0.03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                name.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxFontSize: 22,
                minFontSize: 20,
              ),
              AutoSizeText(
                time.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              )
            ],
          ),
          SizedBox(
            width: MWidth * 0.04,
          ),
          Chip(
            label: Text(
              tag,
              style: const TextStyle(color: Colors.orange, fontSize: 12),
            ),
            backgroundColor: Colors.black,
          )
        ],
      ),
    );
  }
}
