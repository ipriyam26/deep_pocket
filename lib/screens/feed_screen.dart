import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/data_feed.dart';
import 'package:deep_pocket_1/models/mock_data.dart';
import 'package:deep_pocket_1/models/user_model.dart';
import 'package:deep_pocket_1/screens/login.dart';
import 'package:deep_pocket_1/screens/new_post_page.dart';
import 'package:deep_pocket_1/screens/user_input.dart';

import 'package:deep_pocket_1/widgets/post_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class feedScreen extends StatefulWidget {
  static const route = '/feed-screen';

  @override
  State<feedScreen> createState() => _feedScreenState();
}

class _feedScreenState extends State<feedScreen> {
  int filter = 0;

  var _intstate = true;
  late SharedPreferences localStorage;

  void updateFilter(tx, context) {
    setState(() {
      filter = tx;
    });

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void filterSheet(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) => Container(
              height: 300,
              child: SingleChildScrollView(
                  child: Container(
                height: 280,
                child: ListView.builder(
                    itemCount: Tag.length,
                    itemBuilder: (ctx, i) => TextButton(
                          onPressed: () {
                            return updateFilter(i, context);
                          },
                          child: Text(Tag[i]),
                        )),
              )),
            ));
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
          TextButton(
              onPressed: () => {filterSheet(context)},
              child: const Text(
                "Filters",
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
              onPressed: () => {Navigator.pushNamed(context, userInput.route)},
              child: const Icon(
                Icons.add_box,
                color: Colors.red,
              )),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Posts")
              .orderBy("Time")
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.orange,
              ));
            }
            return Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => Center(
                          child: InkWell(
                            splashColor: Colors.black,
                            onTap: () {
                              Navigator.pushNamed(context, postPage.route,
                                  arguments: {
                                    'document': snapshot.data!.docs[index],
                                    'user': loggedInuser,
                                  });
                            },
                            child: Container(
                                child: postCard(
                                    MHeight: MHeight,
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
                                    title: snapshot.data!.docs[index]
                                        .data()['Title'],
                                    body: snapshot.data!.docs[index]
                                        .data()['Body'],
                                    time: DateFormat.jm().format(DateTime.parse(
                                        snapshot.data!.docs[index].data()['Time'].toDate().toString())),
                                    likes: snapshot.data!.docs[index].data()['Likes'],
                                    comments: snapshot.data!.docs[index].data()['Comments'],
                                    date: snapshot.data!.docs[index].data()['Date'],
                                    tag: snapshot.data!.docs[index].data()['Tag'])),
                          ),
                        )));
          }),
    );
  }
}
