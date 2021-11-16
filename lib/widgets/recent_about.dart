import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:deep_pocket_1/screens/post/new_post_page.dart';

import 'package:deep_pocket_1/widgets/post_widget.dart';
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

  bool recent = false;
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
            color: Colors.black,
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
                    child: const Text(
                      "Recent",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                SizedBox(
                  width: Mwidth * 0.3,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        recent = false;
                      });
                    },
                    child: const Text(
                      "About",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
                                  'document': snapshot.data!.docs[index],
                                  'user': widget.userdata,
                                });
                          },
                          child: postCard(
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
                            time: DateFormat.jm().format(DateTime.parse(snapshot
                                .data!.docs[index]
                                .data()['Time']
                                .toDate()
                                .toString())),
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
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                              size: 50,
                            ))
                        : Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  color: Colors.black,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                        list[index],
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
                            color: Colors.black,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  list[index],
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
