import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/user_model.dart';
import 'package:deep_pocket_1/widgets/post_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class postPage extends StatelessWidget {
  static const route = '/feed-screen/postPage';
  final commentText = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  // UserModel loggeinUser = UserModel();

  // Future<void> getLoggedUser() async {
  //   final logtry = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get();
  //   final data = logtry.data();

  //   loggeinUser = UserModel(
  //     uid: user!.uid,
  //     email: data!['email'],
  //     enrollmentNo: data['enrollmentNo'],
  //     Name: data['Name'],
  //     Image: data['Image'],
  //     CollegeName: data['CollegeName'],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final MHeight = MediaQuery.of(context).size.height;
    final MWidth = MediaQuery.of(context).size.width;
    final MapArgms =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final document =
        MapArgms['document'] as QueryDocumentSnapshot<Map<String, dynamic>>;
    final loggeinUser = MapArgms['user'] as UserModel;
    // getLoggedUser();
    final id = document.id;
    final ctime = document.data()['Time'];

    final dtime = DateTime.parse(ctime.toDate().toString());

    final time = DateFormat.jm().format(dtime);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              postCardCall(
                  MHeight: MHeight,
                  MWidth: MWidth,
                  document: document,
                  time: time),
              Container(
                padding: EdgeInsets.all(MWidth * 0.01),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(user!.uid)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
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
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("Comments")
                                  .where('PostID', isEqualTo: id)
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<
                                          QuerySnapshot<Map<String, dynamic>>>
                                      snapshot) {
                                if (!snapshot.hasData) {
                                  return Center();
                                }
                                return Container(
                                  // height: MHeight,
                                  child: ListView(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      children: snapshot.data!.docs
                                          .map<Widget>((comment) {
                                        final dtime = DateTime.parse(comment
                                            .data()['Time']
                                            .toDate()
                                            .toString());

                                        final time =
                                            DateFormat.jm().format(dtime);
                                        return Card(
                                          elevation: 0,
                                          child: Container(
                                            // color: Colors.amber,

                                            // padding: EdgeInsets.symmetric(horizontal: MWidth * 0.05),
                                            child: ListTile(
                                              // horizontalTitleGap: 1,
                                              minVerticalPadding: 0,

                                              leading: ClipOval(
                                                child: Container(
                                                  padding: EdgeInsets.all(2),
                                                  color: Colors.black,
                                                  child: ClipOval(
                                                    child: Container(
                                                      height: MWidth * 0.13,
                                                      width: MWidth * 0.13,
                                                      color: Colors.grey,
                                                      child: CachedNetworkImage(
                                                        placeholder: (context,
                                                                url) =>
                                                            Container(
                                                                child: Image.asset(
                                                                    'assets/person.png')),
                                                        imageUrl:
                                                            comment.data()[
                                                                'AuthorPic'],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              trailing: comment
                                                          .data()['AuthorID'] ==
                                                      userdata!['uid']
                                                  ? PopupMenuButton(
                                                      icon: const Icon(
                                                          Icons.more_vert),
                                                      onSelected: (String
                                                          result) async {
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "Comments")
                                                            .doc(comment.id)
                                                            .delete();
                                                      },
                                                      itemBuilder: (BuildContext
                                                              context) =>
                                                          [
                                                        PopupMenuItem(
                                                          value: "Delete",
                                                          child: TextButton.icon(
                                                              onPressed: null,
                                                              icon: const Icon(
                                                                Icons
                                                                    .delete_outline,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              label: const Text(
                                                                "Delete",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              )),
                                                        ),
                                                      ],
                                                    )
                                                  : SizedBox(
                                                      width: MWidth * 0.05,
                                                    ),
                                              title: Row(
                                                children: [
                                                  Text(
                                                    comment.data()[
                                                            'AuthorName'] +
                                                        "   ",
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff36454f),
                                                    ),
                                                  ),
                                                  Text(
                                                    "   " + time,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff36454f),
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
                                                style: TextStyle(fontSize: 14),
                                                trimExpandedText: ' Less',
                                              ),

                                              isThreeLine: true,
                                            ),
                                          ),
                                        );
                                      }).toList()),
                                );
                              }),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
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
  final QueryDocumentSnapshot<Map<String, dynamic>> document;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.symmetric(horizontal: MWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              // height: MHeight * 0.11,
              child: ClipOval(
            child: Container(
              padding: EdgeInsets.all(2),
              color: Colors.black,
              child: ClipOval(
                child: Container(
                  height: MWidth * 0.15,
                  width: MWidth * 0.15,
                  color: Colors.grey,
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        Container(child: Image.asset('assets/person.png')),
                    imageUrl: userdata!['Image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )),
          Container(
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
                if (value.length > 5) {
                  await FirebaseFirestore.instance.collection("Comments").add({
                    'AuthorID': userdata!['uid'],
                    'PostID': id,
                    'AuthorName': userdata!['Name'],
                    'AuthorPic': userdata!['Image'],
                    'Time': DateTime.now(),
                    'CommentText': value,
                    'Likes': 0
                  });
                  await FirebaseFirestore.instance
                      .collection("Posts")
                      .doc(id)
                      .update({'Comments': document.data()['Comments'] + 1});
                  commentText.clear();
                  Fluttertoast.showToast(msg: "Comment posted!!!");
                } else {
                  Fluttertoast.showToast(
                      msg: "Comment too-short atleast 5 characters");
                }
              },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: MWidth * 0.03, vertical: MHeight * 0.01),
                  hintText: "Add a Comment...",
                  border: const OutlineInputBorder(
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
  final QueryDocumentSnapshot<Map<String, dynamic>> document;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "xcross",
      child: postCard(
          AuthorUID: document.data()['AuthorUID'],
          NotinFeed: true,
          MHeight: MHeight,
          MWidth: MWidth,
          imagesList: document.data()['ImageLinks'],
          id: document.id,
          LikedBy: document.data()['LikedBy'],
          name: document.data()['AuthorName'],
          AuthorImage: document.data()['AuthorProfilePic'],
          title: document.data()['Title'],
          body: document.data()['Body'],
          time: time,
          likes: document.data()['Likes'],
          comments: document.data()['Comments'],
          date: document.data()['Date'],
          tag: document.data()['Tag']),
    );
  }
}
