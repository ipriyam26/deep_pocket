import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/screens/profile/edit_profile.dart';
import 'package:deep_pocket_1/screens/login-signup/login.dart';

import 'package:deep_pocket_1/widgets/recent_about.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class profileScreen extends StatefulWidget {
  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            runApp(MaterialApp(
              home: LoginScreen(),
            ));
          },
          child: const Icon(Icons.add)),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(user!.uid)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Container(
                height: 50,
                width: 50,
                child: CupertinoActivityIndicator(),
              ));
            }

            var userdata = snapshot.data!.data();
            return SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: Column(
                      children: [
                        userImageName(
                          name: userdata!['Name'],
                          Image: userdata['Image'],
                          college: userdata['CollegeName'],
                        ),
                        editprofile(),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [headingColumn2(), Credentials()],
                    ),
                  ),
                  RecentAbout(),
                ],
              )),
            );
          }),
    );
  }
}

class Credentials extends StatelessWidget {
  const Credentials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.18,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.star_outline,
                  color: Colors.grey,
                ),
                label: const Text(
                  "Add your Skill",
                  style: TextStyle(fontSize: 12),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.book_sharp,
                  color: Colors.grey,
                ),
                label: const Text(
                  "Add education credentials",
                  style: TextStyle(fontSize: 12),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.sports_esports_outlined,
                  color: Colors.grey,
                ),
                label: const Text(
                  "Add your hobbies",
                  style: TextStyle(fontSize: 12),
                )),
          ],
        ));
  }
}

class headingColumn2 extends StatelessWidget {
  const headingColumn2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.007),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Credentials & Highlights",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.035,
              decoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    size: 13,
                    color: Colors.white,
                  )),
            )
          ],
        ));
  }
}

class editprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          width: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, editProfile.route);
            },
            icon: Icon(Icons.edit),
            label: Text("Edit Profile"),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.share))
      ],
    ));
  }
}

class userImageName extends StatelessWidget {
  userImageName({
    required this.name,
    required this.Image,
    required this.college,
  });

  final String name;
  final String Image;
  final String college;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.height * 0.14,
                height: MediaQuery.of(context).size.height * 0.14,
                child: CachedNetworkImage(
                  placeholder: (context, url) => Container(
                      height: 50, child: const CircularProgressIndicator()),
                  imageUrl: Image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSizeText(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    minFontSize: 20,
                    maxFontSize: 23,
                  ),
                  Text(
                    college,
                    style: const TextStyle(
                        fontSize: 17, fontStyle: FontStyle.italic),
                  ),
                  // SizedBox(height:MediaQuery.of(context).size.height ,)
                ],
              ),
            )
          ],
        ));
  }
}
