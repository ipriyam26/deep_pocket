// ignore_for_file: use_key_in_widget_constructors, camel_case_types, avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/data_feed.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:deep_pocket_1/models/user_model.dart';
import 'package:deep_pocket_1/screens/login-signup/login.dart';
import 'package:deep_pocket_1/screens/menu-pages/menu.dart';

import 'package:deep_pocket_1/screens/post/new_post_page.dart';
import 'package:deep_pocket_1/screens/post/special_post.dart';
import 'package:deep_pocket_1/screens/profile/search_user.dart';

import 'package:deep_pocket_1/widgets/post_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class feedScreen extends StatefulWidget {
  static const route = '/feed-screen';

  @override
  State<feedScreen> createState() => _feedScreenState();
}

class _feedScreenState extends State<feedScreen> {
  int filter = 0;

  late SharedPreferences localStorage;
  final ScrollController _scrollController = ScrollController();
  void updateFilter(tx, context) {
    setState(() {
      filter = tx;
      currentMax = 5;
    });

    Navigator.of(context).pop();
  }

  void filterSheet(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) => SizedBox(
              height: 300,
              child: SingleChildScrollView(
                  child: Container(
                color: const Color.fromRGBO(16, 15, 1, 1),
                height: 280,
                child: ListView.builder(
                    itemCount: Tag.length,
                    itemBuilder: (ctx, i) => TextButton(
                          onPressed: () {
                            return updateFilter(i, context);
                          },
                          child: Text(
                            Tag[i].toUpperCase(),
                            style: const TextStyle(color: Colors.pink),
                          ),
                        )),
              )),
            ));
  }

  int currentMax = 5;
  Stream<QuerySnapshot<Map<String, dynamic>>> getposts() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("reached end");
        setState(() {
          currentMax = currentMax + 5;
        });
      }
    });

    return FirebaseFirestore.instance
        .collection("Posts")
        .orderBy("Time", descending: true)
        .limit(currentMax)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getFilteredposts() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("reached end");
        setState(() {
          currentMax = currentMax + 5;
        });
      }
    });

    return FirebaseFirestore.instance
        .collection("Posts")
        .orderBy("Time", descending: true)
        .where('Tag', isEqualTo: Tag[filter])
        .limit(currentMax)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final MHeight = MediaQuery.of(context).size.height;
    final MWidth = MediaQuery.of(context).size.width;
    final loggedInuser = Provider.of<UserModel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
          title: const Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchUser.route);
                },
                icon: const Icon(Icons.search)),
            TextButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();

                  await FirebaseAuth.instance.signOut();
                  runApp(const MaterialApp(
                    home: LoginScreen(),
                  ));
                },
                child: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
                onPressed: () => {filterSheet(context)},
                child: const Text(
                  "Filters",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
        backgroundColor: Colors.black,
        body: StreamBuilder(
            stream: filter == 0 ? getposts() : getFilteredposts(),

            // getposts(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, i) => Container(
                    margin: EdgeInsets.symmetric(vertical: MHeight * 0.01),
                    child: Image.asset(
                      "assets/feedcard.gif",
                      width: MWidth * 0.98,
                      height: MHeight * 0.7,
                    ),
                  ),
                );
              }
              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    kIsWeb
                        ? SizedBox(height: MHeight * 0.3, child: MenuP())
                        : SizedBox(height: MHeight * 0.22, child: MenuP()),
                    SizedBox(
                      height: MHeight * 0.005,
                    ),
                    ListView.builder(
                        // controller: _scrollController,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length + 1,
                        itemBuilder: (context, index) => index ==
                                snapshot.data!.docs.length
                            ? const CupertinoActivityIndicator()
                            : snapshot.data!.docs[index].data()['Tag'] !=
                                        'Internship' &&
                                    snapshot.data!.docs[index].data()['Tag'] !=
                                        'Event' &&
                                    snapshot.data!.docs[index].data()['Tag'] !=
                                        'Notice'
                                ? snapshot.data!.docs[index].data()['Tag'] ==
                                        'Nearby'
                                    ? Center(
                                        child: InkWell(
                                          splashColor: Colors.pinkAccent,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, postPage.route,
                                                arguments: {
                                                  'documentid': snapshot
                                                      .data!.docs[index].id,
                                                  'user': loggedInuser,
                                                });
                                          },
                                          child: nearbyPost(
                                              nearbyID: snapshot.data!.docs[index]
                                                  .data()['NearbyID'],
                                              points: snapshot.data!.docs[index]
                                                      .data()['Points '] ??
                                                  0,
                                              AuthorUID: snapshot.data!.docs[index]
                                                  .data()['AuthorUID'],
                                              DislikedBy: snapshot
                                                  .data!.docs[index]
                                                  .data()['DislikedBy'],
                                              MHeight: MHeight,
                                              Anonymous: snapshot.data!.docs[index]
                                                      .data()['Anonymous'] ??
                                                  false,
                                              NotinFeed: false,
                                              MWidth: MWidth,
                                              imagesList: snapshot
                                                  .data!.docs[index]
                                                  .data()['ImageLinks'],
                                              id: snapshot.data!.docs[index].id,
                                              LikedBy: snapshot.data!.docs[index].data()['LikedBy'],
                                              name: snapshot.data!.docs[index].data()['AuthorName'],
                                              AuthorImage: snapshot.data!.docs[index].data()['AuthorProfilePic'],
                                              SpecialID: snapshot.data!.docs[index].data()['SpecialID'],
                                              title: snapshot.data!.docs[index].data()['Title'],
                                              body: snapshot.data!.docs[index].data()['Body'],
                                              time: DateTime.parse(snapshot.data!.docs[index].data()['Time'].toDate().toString()),
                                              likes: snapshot.data!.docs[index].data()['Likes'],
                                              comments: snapshot.data!.docs[index].data()['Comments'],
                                              date: snapshot.data!.docs[index].data()['Date'],
                                              tag: snapshot.data!.docs[index].data()['Tag']),
                                        ),
                                      )
                                    : Center(
                                        child: InkWell(
                                          splashColor: Colors.pinkAccent,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, postPage.route,
                                                arguments: {
                                                  'documentid': snapshot
                                                      .data!.docs[index].id,
                                                  'user': loggedInuser,
                                                });
                                          },
                                          child: postCard(
                                              points: snapshot.data!.docs[index].data()['Points '] ??
                                                  0,
                                              AuthorUID: snapshot.data!.docs[index]
                                                  .data()['AuthorUID'],
                                              MHeight: MHeight,
                                              Anonymous: snapshot.data!.docs[index]
                                                      .data()['Anonymous'] ??
                                                  false,
                                              NotinFeed: false,
                                              MWidth: MWidth,
                                              imagesList: snapshot.data!.docs[index]
                                                  .data()['ImageLinks'],
                                              id: snapshot.data!.docs[index].id,
                                              LikedBy: snapshot.data!.docs[index]
                                                  .data()['LikedBy'],
                                              name: snapshot.data!.docs[index]
                                                  .data()['AuthorName'],
                                              AuthorImage: snapshot
                                                  .data!.docs[index]
                                                  .data()['AuthorProfilePic'],
                                              title: snapshot.data!.docs[index].data()['Title'],
                                              body: snapshot.data!.docs[index].data()['Body'],
                                              time: DateTime.parse(snapshot.data!.docs[index].data()['Time'].toDate().toString()),
                                              likes: snapshot.data!.docs[index].data()['Likes'],
                                              comments: snapshot.data!.docs[index].data()['Comments'],
                                              date: snapshot.data!.docs[index].data()['Date'],
                                              tag: snapshot.data!.docs[index].data()['Tag']),
                                        ),
                                      )
                                : Center(
                                    child: InkWell(
                                      splashColor: Colors.pinkAccent,
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, postPage.route,
                                            arguments: {
                                              'documentid':
                                                  snapshot.data!.docs[index].id,
                                              'user': loggedInuser,
                                            });
                                      },
                                      child: internshipPost(
                                          SpecialID: snapshot.data!.docs[index]
                                              .data()['SpecialID'],
                                          points: snapshot.data!.docs[index].data()['Points '] ??
                                              0,
                                          AuthorUID: snapshot.data!.docs[index]
                                              .data()['AuthorUID'],
                                          MHeight: MHeight,
                                          Anonymous: snapshot.data!.docs[index]
                                                  .data()['Anonymous'] ??
                                              false,
                                          NotinFeed: false,
                                          MWidth: MWidth,
                                          imagesList: snapshot.data!.docs[index]
                                              .data()['ImageLinks'],
                                          id: snapshot.data!.docs[index].id,
                                          LikedBy: snapshot.data!.docs[index]
                                              .data()['LikedBy'],
                                          name: snapshot.data!.docs[index]
                                              .data()['AuthorName'],
                                          AuthorImage: snapshot.data!.docs[index]
                                              .data()['AuthorProfilePic'],
                                          title: snapshot.data!.docs[index].data()['Title'],
                                          body: snapshot.data!.docs[index].data()['Body'],
                                          time: DateTime.parse(snapshot.data!.docs[index].data()['Time'].toDate().toString()),
                                          likes: snapshot.data!.docs[index].data()['Likes'],
                                          comments: snapshot.data!.docs[index].data()['Comments'],
                                          date: snapshot.data!.docs[index].data()['Date'],
                                          tag: snapshot.data!.docs[index].data()['Tag']),
                                    ),
                                  )),
                  ],
                ),
              );
            }));
  }
}
