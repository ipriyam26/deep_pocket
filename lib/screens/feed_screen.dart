import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/data_feed.dart';
import 'package:deep_pocket_1/models/mock_data.dart';
import 'package:deep_pocket_1/screens/login.dart';
import 'package:deep_pocket_1/screens/user_input.dart';

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
          stream: FirebaseFirestore.instance.collection("Posts").snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView(
                children: snapshot.data!.docs.map<Widget>((document) {
                  final imageList = document.data()['ImageLinks'];
                  print(imageList);
                  return Center(
                    child: Container(
                        child: postCard(
                      MHeight: MHeight,
                      MWidth: MWidth,
                      imagesList: imageList,
                      name: document.data()['AuthorName'],
                      AuthorImage: document.data()['AuthorProfilePic'],
                      title: document.data()['Title'],
                      body: document.data()['Body'],
                      time: document.data()['Time'],
                      likes: document.data()['Likes'],
                      comments: document.data()['Comments'],
                    )),
                  );
                }).toList(),
              ),
            );
          }),
    );
  }
}
