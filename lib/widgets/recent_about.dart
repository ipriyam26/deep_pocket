import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:deep_pocket_1/screens/post/new_post_page.dart';

import 'package:deep_pocket_1/widgets/post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RecentAbout extends StatefulWidget {
  final Map<String, dynamic> userdata;

  const RecentAbout({
    Key? key,
    required this.userdata,
  }) : super(key: key);

  @override
  State<RecentAbout> createState() => _RecentAboutState();
}

class _RecentAboutState extends State<RecentAbout> {
  ScrollController _scrollController = ScrollController();

  bool recent = true;
  int currentMax = 3;
  bool _editing = false;
  Stream<QuerySnapshot<Map<String, dynamic>>> getposts() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("reached end");
        setState(() {
          currentMax = currentMax + 3;
        });
      }
    });

    return FirebaseFirestore.instance
        .collection("Posts")
        .where("AuthorUID", isEqualTo: widget.userdata['uid'])
        .orderBy("Time", descending: true)
        .limit(currentMax)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final Mwidth = MediaQuery.of(context).size.width;
    return Container(
        child: Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.04,
            color: const Color.fromRGBO(16, 15, 1, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Mwidth * 0.15,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      recent = true;
                    });
                  },
                  child: recent
                      ? const Text(
                          "Recent",
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      : const Text(
                          "Recent",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                ),
                SizedBox(
                  width: Mwidth * 0.3,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        recent = false;
                      });
                    },
                    child: recent
                        ? const Text(
                            "About",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        : const Text(
                            "About",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
                SizedBox(
                  width: Mwidth * 0.05,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _editing = !_editing;
                      });
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.pink,
                      size: 20,
                    ))
              ],
            )),
        recent
            ? StreamBuilder(
                stream: getposts(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    );
                  }
                  if (snapshot.data!.docs.length == 0) {
                    return Container(
                      child: Center(
                          child: Column(
                        children: [
                          CachedNetworkImage(
                            fadeInDuration: const Duration(microseconds: 0),
                            fadeOutDuration: const Duration(microseconds: 0),
                            placeholder: (context, url) =>
                                const CupertinoActivityIndicator(),
                            imageUrl:
                                "https://media.giphy.com/media/l3q2SlRG7lKR3BCVO/giphy.gif",
                            fit: BoxFit.fitWidth,
                            height: Mwidth * 0.8,
                          ),
                          const Text(
                            "Post Something To See",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                          // child: Image.network(
                          //   "https://media.giphy.com/media/l3q2SlRG7lKR3BCVO/giphy.gif",
                          //   // height: Mwidth * 0.6,
                          // ),
                          ),
                    );
                  }
                  return Container(
                    // height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) => Center(
                        child: InkWell(
                          splashColor: Colors.black,
                          onTap: () {
                            Navigator.pushNamed(context, postPage.route,
                                arguments: {
                                  'documentid': snapshot.data!.docs[index].id,
                                  'user': widget.userdata,
                                });
                          },
                          child: postCard(
                            points:
                                snapshot.data!.docs[index].data()['Points '] ??
                                    0,
                            Anonymous: snapshot.data!.docs[index]
                                    .data()['Anonymous'] ??
                                false,
                            AuthorUID:
                                snapshot.data!.docs[index].data()['AuthorUID'],
                            MHeight: MediaQuery.of(context).size.height,
                            MWidth: MediaQuery.of(context).size.width,
                            imagesList:
                                snapshot.data!.docs[index].data()['ImageLinks'],
                            name:
                                snapshot.data!.docs[index].data()['AuthorName'],
                            AuthorImage: snapshot.data!.docs[index]
                                .data()['AuthorProfilePic'],
                            title: snapshot.data!.docs[index].data()['Title'],
                            body: snapshot.data!.docs[index].data()['Body'],
                            time: DateTime.parse(snapshot.data!.docs[index]
                                .data()['Time']
                                .toDate()
                                .toString()),
                            likes: snapshot.data!.docs[index].data()['Likes'],
                            comments:
                                snapshot.data!.docs[index].data()['Comments'],
                            date: snapshot.data!.docs[index].data()['Date'],
                            tag: snapshot.data!.docs[index].data()['Tag'],
                            id: snapshot.data!.docs[index].id,
                            LikedBy:
                                snapshot.data!.docs[index].data()['LikedBy'],
                            NotinFeed: false,
                          ),
                        ),
                      ),
                    ),
                  );
                })
            : Credentials(userdata: widget.userdata, editing: _editing)
      ],
    ));
  }
}

class Credentials extends StatelessWidget {
  final bool editing;
  const Credentials({
    Key? key,
    required this.userdata,
    required this.editing,
  }) : super(key: key);
  final Map<String, dynamic> userdata;

  @override
  Widget build(BuildContext context) {
    final Mheight = MediaQuery.of(context).size.height;
    final Mwidth = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03),
        width: Mwidth,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            ListGrid(
                userdata: userdata, title: 'Certificate', editing: editing),
            SizedBox(
              height: Mheight * 0.02,
            ),
            ListGrid(userdata: userdata, title: 'Skill', editing: editing),
            SizedBox(
              height: Mheight * 0.02,
            ),
            ListGrid(userdata: userdata, title: 'Project', editing: editing),
          ],
        ));
  }
}

class ListGrid extends StatelessWidget {
  final Map<String, dynamic> userdata;
  final bool editing;

  final String title;
  const ListGrid({
    Key? key,
    required this.userdata,
    required this.title,
    required this.editing,
  }) : super(key: key);

  Future<void> _pickImage(BuildContext context) async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (newimage == null) {
        return;
      }
      String tt = " ";
      final dialogueImage = File(newimage.path);
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            final nameController = TextEditingController();
            return Dialog(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            dialogueImage,
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            controller: nameController,
                            decoration:
                                InputDecoration(hintText: "One Word Title"),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              tt = nameController.text.toString();
                              Navigator.pop(ctx);
                            },
                            child: Text("ADD"))
                      ])),
            );
          });
      var link = await API_Manager().postImage(newimage.path);

      String head = title + "text";

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userdata['uid'])
          .update({
        head: FieldValue.arrayUnion([tt]),
        title: FieldValue.arrayUnion([link])
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> list = userdata[title] ?? [];
    final List<dynamic> listText = userdata[title + "text"] ?? [];
    final Mheight = MediaQuery.of(context).size.height;
    final Mwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          title + "s",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Mheight * 0.01,
        ),
        // if (list.length > 0)
        editing
            ? Container(
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 10 / 9,
                            crossAxisSpacing: 5,
                            crossAxisCount: 4),
                    itemBuilder: (context, index) => index == list.length
                        ? IconButton(
                            onPressed: () {
                              _pickImage(context);
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color.fromRGBO(40, 40, 43, 1),
                              size: 50,
                            ))
                        : Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  color: const Color.fromRGBO(40, 40, 43, 1),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(microseconds: 0),
                                        fadeOutDuration:
                                            const Duration(microseconds: 2),
                                        placeholder: (context, url) =>
                                            const CupertinoActivityIndicator(),
                                        imageUrl: list[index],
                                        fit: BoxFit.cover,
                                        height: Mheight * 0.07,
                                      ),
                                      Text(
                                        listText[index]
                                            .toString()
                                            .split(" ")[0]
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -Mheight * 0.02,
                                left: Mwidth * 0.14,
                                child: IconButton(
                                    onPressed: () async {
                                      list.removeAt(index);
                                      listText.removeAt(index);
                                      // print(listText);
                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(userdata['uid'])
                                          .update({
                                        title: list,
                                        title + "text": listText
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          )),
              )
            : Container(
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 10 / 9,
                            crossAxisSpacing: 5,
                            crossAxisCount: 4),
                    itemBuilder: (context, index) => ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Color.fromRGBO(40, 40, 43, 1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CachedNetworkImage(
                                  fadeInDuration:
                                      const Duration(microseconds: 0),
                                  fadeOutDuration:
                                      const Duration(microseconds: 2),
                                  placeholder: (context, url) =>
                                      const CupertinoActivityIndicator(),
                                  imageUrl: list[index],
                                  fit: BoxFit.cover,
                                  height: Mheight * 0.07,
                                ),
                                Text(
                                  listText[index]
                                      .toString()
                                      .split(" ")[0]
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )),
              )
      ],
    );
  }
}
