// ignore_for_file: non_constant_identifier_names, camel_case_types, use_function_type_syntax_for_parameters, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/admin.dart';
import 'package:deep_pocket_1/screens/post/special_post.dart';
import 'package:deep_pocket_1/screens/profile/search_profile_screen.dart';

import 'package:deep_pocket_1/widgets/post_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import 'package:readmore/readmore.dart';

class postPage extends StatelessWidget {
  static const route = '/feed-screen/postPage';
  final commentText = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  postPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MHeight = MediaQuery.of(context).size.height;
    final MWidth = MediaQuery.of(context).size.width;
    final MapArgms =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final documentid = MapArgms['documentid'] as String;

    // getLoggedUser();
    Future<DocumentSnapshot<Map<String, dynamic>>> getcorrectAnswere(
        String id) async {
      var data =
          await FirebaseFirestore.instance.collection("Comments").doc(id).get();
      return data;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Posts")
                .doc(documentid)
                .snapshots(),
            builder: (context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                    snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
              final document = snapshot.data;
              final id = document!.id;
              final ctime = document.data()!['Time'];

              final dtime = DateTime.parse(ctime.toDate().toString());

              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    postCardCall(
                        MHeight: MHeight,
                        MWidth: MWidth,
                        document: document,
                        time: dtime),
                    Container(
                      padding: EdgeInsets.all(MWidth * 0.01),
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .doc(user!.uid)
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<
                                      DocumentSnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            var userdata = snapshot.data!.data();

                            return Column(
                              children: [
                                UserComment(
                                    MWidth: MWidth,
                                    userdata: userdata,
                                    MHeight: MHeight,
                                    commentText: commentText,
                                    id: id,
                                    document: document),
                                if (document.data()!['Tag'] == 'Query' &&
                                    document.data()!['Correct Answere'] != null)
                                  correctAnswere(
                                      getcorrectAnswere, document, MWidth),
                                StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("Comments")
                                        .where('PostID', isEqualTo: id)
                                        .orderBy("Time", descending: true)
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<
                                                QuerySnapshot<
                                                    Map<String, dynamic>>>
                                            snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return ListView(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          children: snapshot.data!.docs
                                              .map<Widget>((comment) {
                                            final dtime = DateTime.parse(comment
                                                .data()['Time']
                                                .toDate()
                                                .toString());

                                            final time =
                                                DateFormat.jm().format(dtime);
                                            return commetCard(
                                                MWidth,
                                                comment,
                                                document,
                                                userdata,
                                                context,
                                                time);
                                          }).toList());
                                    }),
                              ],
                            );
                          }),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  Container correctAnswere(
      Future<DocumentSnapshot<Map<String, dynamic>>> getcorrectAnswere(
          String id),
      DocumentSnapshot<Map<String, dynamic>> document,
      double MWidth) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: FutureBuilder(
          future: getcorrectAnswere(document.data()!['Correct Answere']),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> comment) {
            if (!comment.hasData) {
              return const CircularProgressIndicator(color: Colors.pink);
            }
            return ListTile(
              // horizontalTitleGap: 1,
              minVerticalPadding: 0,

              leading: ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  color: Colors.black,
                  child: ClipOval(
                    child: Container(
                      height: MWidth * 0.13,
                      width: MWidth * 0.13,
                      color: Colors.grey,
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            Image.asset('assets/person.png'),
                        imageUrl: comment.data!.data()!['AuthorPic'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              trailing: const Icon(
                Icons.done_outline_rounded,
                color: Colors.pink,
              ),
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, searchProfileScreen.route,
                          arguments:
                              comment.data!.data()!['AuthorID'].toString());
                    },
                    child: Text(
                      comment.data!
                          .data()!['AuthorName']
                          .toString()
                          .split(" ")[0],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              // horizontalTitleGap: 0,
              subtitle: ReadMoreText(
                comment.data!.data()!['CommentText'],
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                // trimCollapsedText: '..Read More',
                style: TextStyle(
                    fontSize: 14, color: Colors.white.withOpacity(0.7)),
                trimExpandedText: ' Less',
              ),

              isThreeLine: true,
            );
          }),
    );
  }

  Card commetCard(
      double MWidth,
      QueryDocumentSnapshot<Map<String, dynamic>> comment,
      DocumentSnapshot<Map<String, dynamic>> document,
      Map<String, dynamic>? userdata,
      BuildContext context,
      String time) {
    return Card(
      color: const Color.fromRGBO(11, 10, 10, 1),
      elevation: 0,
      child: GetBuilder(
          init: userRoleController(),
          builder: (userRoleController roleController) {
            return ListTile(
              // horizontalTitleGap: 1,
              minVerticalPadding: 0,

              leading: ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  color: Colors.black,
                  child: ClipOval(
                    child: Container(
                      height: MWidth * 0.13,
                      width: MWidth * 0.13,
                      color: Colors.grey,
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            Image.asset('assets/person.png'),
                        imageUrl: comment.data()['AuthorPic'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              trailing: (document.data()!['AuthorUID'] == userdata!['uid']) ||
                      (comment.data()['AuthorID'] == userdata['uid']) ||
                      (roleController.admins!.contains(user!.uid))
                  ? deleteComment(
                      comment: comment,
                      document: document,
                    )
                  : SizedBox(
                      width: MWidth * 0.05,
                    ),
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, searchProfileScreen.route,
                          arguments: comment.data()['AuthorID'].toString());
                    },
                    child: Text(
                      comment.data()['AuthorName'].toString().split(" ")[0],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "   " + time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              // horizontalTitleGap: 0,
              subtitle: ReadMoreText(
                comment.data()['CommentText'],
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                // trimCollapsedText: '..Read More',
                style: TextStyle(
                    fontSize: 14, color: Colors.white.withOpacity(0.7)),
                trimExpandedText: ' Less',
              ),

              isThreeLine: true,
            );
          }),
    );
  }
}

class deleteComment extends StatelessWidget {
  const deleteComment({
    Key? key,
    required this.comment,
    required this.document,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> comment;
  final DocumentSnapshot<Map<String, dynamic>>? document;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onSelected: (String result) async {
        if (result == "Delete") {
          await FirebaseFirestore.instance
              .collection("Comments")
              .doc(comment.id)
              .delete();
          await FirebaseFirestore.instance
              .collection("Posts")
              .doc(comment.data()["PostID"])
              .update({"Comments": document!.data()!['Comments'] - 1});
        } else {
          var authordata = await FirebaseFirestore.instance
              .collection("users")
              .doc(document!.data()!['AuthorUID'])
              .get();
          int authorPoints = authordata.data()!['Points'];
          print(authorPoints);
          // ignore: unused_local_variable
          var Cauthordata = await FirebaseFirestore.instance
              .collection("users")
              .doc(comment.data()['AuthorID'])
              .get();
          int CauthorPoints = authordata.data()!['Points'];
          print(CauthorPoints);

          print(document!.data()!['Points '].toString());
          await FirebaseFirestore.instance
              .collection("Comments")
              .doc(comment.id)
              .update({'isCorrect': true});
          await FirebaseFirestore.instance
              .collection("Posts")
              .doc(document!.id)
              .update({'Correct Answere': comment.id});
          await FirebaseFirestore.instance
              .collection("users")
              .doc(document!.data()!['AuthorUID'])
              .update({'Points': authorPoints - document!.data()!['Points ']});
          await FirebaseFirestore.instance
              .collection("users")
              .doc(comment.data()['AuthorID'])
              .update({'Points': CauthorPoints + document!.data()!['Points ']});
        }
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
        if (document!.data()!['Tag'] == 'Query' &&
            document!.data()!['Correct Answere'] == null)
          PopupMenuItem(
            value: "Correct",
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(
                  Icons.done,
                  color: Colors.pink,
                ),
                label: const Text(
                  "Correct",
                  style: TextStyle(color: Colors.black),
                )),
          ),
      ],
    );
  }
}

class UserComment extends StatelessWidget {
  const UserComment({
    Key? key,
    required this.MWidth,
    required this.userdata,
    required this.MHeight,
    required this.commentText,
    required this.id,
    required this.document,
  }) : super(key: key);

  final double MWidth;
  final Map<String, dynamic>? userdata;
  final double MHeight;
  final TextEditingController commentText;
  final String id;
  final DocumentSnapshot<Map<String, dynamic>>? document;

  @override
  Widget build(BuildContext context) {
    int commentNo = document!.data()!['Comments'];

    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.symmetric(horizontal: MWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(2),
              color: Colors.black,
              child: ClipOval(
                child: Container(
                  height: MWidth * 0.15,
                  width: MWidth * 0.15,
                  color: Colors.grey,
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        Image.asset('assets/person.png'),
                    imageUrl: userdata!['Image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MHeight * 0.07,
            width: MWidth * 0.75,
            child: TextField(
              expands: true,
              maxLines: null,
              autocorrect: false,
              controller: commentText,
              scrollPadding: EdgeInsets.zero,
              minLines: null,
              onSubmitted: (value) async {
                if (value.length > 2) {
                  await FirebaseFirestore.instance.collection("Comments").add({
                    'AuthorID': userdata!['uid'],
                    'PostID': id,
                    'AuthorName': userdata!['Name'],
                    'AuthorPic': userdata!['Image'],
                    'Time': DateTime.now(),
                    'CommentText': value,
                    'Likes': 0
                  });
                  commentNo += 1;
                  await FirebaseFirestore.instance
                      .collection("Posts")
                      .doc(id)
                      .update({'Comments': commentNo});
                  commentText.clear();
                  Fluttertoast.showToast(msg: "Comment posted!!!");
                } else {
                  Fluttertoast.showToast(
                      msg: "Comment too-short atleast 2 characters");
                }
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: MWidth * 0.03, vertical: MHeight * 0.01),
                  hintText: "Add a Comment...",
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
        ],
      ),
    );
  }
}

class postCardCall extends StatelessWidget {
  const postCardCall({
    Key? key,
    required this.MHeight,
    required this.MWidth,
    required this.document,
    required this.time,
  }) : super(key: key);

  final double MHeight;
  final double MWidth;
  final DocumentSnapshot<Map<String, dynamic>>? document;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "xcross",
      child: document!.data()!['Tag'] != 'Internship' &&
              document!.data()!['Tag'] != 'Event' &&
              document!.data()!['Tag'] != 'Notice'
          ? document!.data()!['Tag'] == 'Nearby'
              ? nearbyPost(
                  nearbyID: document!.data()!['NearbyID'],
                  points: document!.data()!['Points '] ?? 0,
                  AuthorUID: document!.data()!['AuthorUID'],
                  DislikedBy: document!.data()!['DislikedBy'],
                  MHeight: MHeight,
                  Anonymous: document!.data()!['Anonymous'] ?? false,
                  NotinFeed: false,
                  MWidth: MWidth,
                  imagesList: document!.data()!['ImageLinks'],
                  id: document!.id,
                  LikedBy: document!.data()!['LikedBy'],
                  name: document!.data()!['AuthorName'],
                  AuthorImage: document!.data()!['AuthorProfilePic'],
                  SpecialID: document!.data()!['SpecialID'],
                  title: document!.data()!['Title'],
                  body: document!.data()!['Body'],
                  time: DateTime.parse(
                      document!.data()!['Time'].toDate().toString()),
                  likes: document!.data()!['Likes'],
                  comments: document!.data()!['Comments'],
                  date: document!.data()!['Date'],
                  tag: document!.data()!['Tag'])
              : postCard(
                  Anonymous: document!.data()!['Anonymous'] ?? false,
                  points: document!.data()!['Points '] ?? 0,
                  AuthorUID: document!.data()!['AuthorUID'],
                  NotinFeed: true,
                  MHeight: MHeight,
                  MWidth: MWidth,
                  imagesList: document!.data()!['ImageLinks'],
                  id: document!.id,
                  LikedBy: document!.data()!['LikedBy'],
                  name: document!.data()!['AuthorName'],
                  AuthorImage: document!.data()!['AuthorProfilePic'],
                  title: document!.data()!['Title'],
                  body: document!.data()!['Body'],
                  time: time,
                  likes: document!.data()!['Likes'],
                  comments: document!.data()!['Comments'],
                  date: document!.data()!['Date'],
                  tag: document!.data()!['Tag'])
          : internshipPost(
              SpecialID: document!.data()!['SpecialID'],
              Anonymous: document!.data()!['Anonymous'] ?? false,
              points: document!.data()!['Points '] ?? 0,
              AuthorUID: document!.data()!['AuthorUID'],
              NotinFeed: true,
              MHeight: MHeight,
              MWidth: MWidth,
              imagesList: document!.data()!['ImageLinks'],
              id: document!.id,
              LikedBy: document!.data()!['LikedBy'],
              name: document!.data()!['AuthorName'],
              AuthorImage: document!.data()!['AuthorProfilePic'],
              title: document!.data()!['Title'],
              body: document!.data()!['Body'],
              time: time,
              likes: document!.data()!['Likes'],
              comments: document!.data()!['Comments'],
              date: document!.data()!['Date'],
              tag: document!.data()!['Tag']),
    );
  }
}
