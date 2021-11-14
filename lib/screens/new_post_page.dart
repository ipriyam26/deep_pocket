import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/user_model.dart';
import 'package:deep_pocket_1/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class postPage extends StatelessWidget {
  static const route = '/feed-screen/postPage';
  final commentText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MHeight = MediaQuery.of(context).size.height;
    final MWidth = MediaQuery.of(context).size.width;
    final MapArgms =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final document =
        MapArgms['document'] as QueryDocumentSnapshot<Map<String, dynamic>>;
    final loggeinUser = MapArgms['user'] as UserModel;
    final id = document.id;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: "xcross",
                child: postCard(
                    MHeight: MHeight,
                    MWidth: MWidth,
                    imagesList: document.data()['ImageLinks'],
                    id: document.id,
                    LikedBy: document.data()['LikedBy'],
                    name: document.data()['AuthorName'],
                    AuthorImage: document.data()['AuthorProfilePic'],
                    title: document.data()['Title'],
                    body: document.data()['Body'],
                    time: document.data()['Time'],
                    likes: document.data()['Likes'],
                    comments: document.data()['Comments'],
                    date: document.data()['Date'],
                    tag: document.data()['Tag']),
              ),
              Container(
                padding: EdgeInsets.all(MWidth * 0.01),
                child: Column(
                  children: [
                    Container(
                      // color: Colors.amber,
                      // padding: EdgeInsets.symmetric(horizontal: MWidth * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: MHeight * 0.11,
                            // color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Container(
                                    width: MWidth * 0.12,
                                    height: MWidth * 0.12,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                loggeinUser.Image!),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                SizedBox(
                                  height: MHeight * 0.02,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: MHeight * 0.09,
                            width: MWidth * 0.8,
                            child: TextField(
                              expands: true,
                              maxLines: null,
                              autocorrect: false,
                              controller: commentText,
                              maxLength: 200,
                              scrollPadding: EdgeInsets.zero,
                              minLines: null,
                              onSubmitted: (value) async {
                                await FirebaseFirestore.instance
                                    .collection("Comments")
                                    .add({
                                  'AuthorID': loggeinUser.uid,
                                  'PostID': id,
                                  'AuthorName': loggeinUser.Name,
                                  'AuthorPic': loggeinUser.Image,
                                  'Time': DateTime.now(),
                                  'CommentText': value,
                                  'Likes': 0
                                });
                                commentText.clear();
                                Fluttertoast.showToast(
                                    msg: "Comment posted!!!");
                              },
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: MWidth * 0.03,
                                      vertical: MHeight * 0.01),
                                  hintText: "Add a Comment...",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // StreamBuilder(
                    //     stream: FirebaseFirestore.instance
                    //         .collection("Comments")
                    //         .where('postId', isEqualTo: id)
                    //         .snapshots(),
                    //     builder: (context,
                    //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                    //             snapshot) {
                    //       print(snapshot.data);
                    //       return Container(
                    //         // color: Colors.amber,
                    //         height: MHeight * 0.354,
                    //         // padding: EdgeInsets.symmetric(horizontal: MWidth * 0.05),
                    //         child: ListTile(
                    //           leading: const ClipOval(child: FlutterLogo()),
                    //           trailing: IconButton(
                    //               onPressed: () {},
                    //               icon: const Icon(Icons.more_vert)),
                    //           title: const Text("User Name2"),
                    //           // horizontalTitleGap: 0,
                    //           subtitle: const ReadMoreText(
                    //             "Is that the right way ? can't I just start a project from vscode and then upload it to my git ?",
                    //             trimLines: 2,
                    //             colorClickableText: Colors.pink,
                    //             trimMode: TrimMode.Line,
                    //             // trimCollapsedText: '..Read More',
                    //             style: TextStyle(fontSize: 13),
                    //             trimExpandedText: ' Less',
                    //           ),

                    //           isThreeLine: true,
                    //         ),
                    //       );
                    //     }),
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
