import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'notice_model.dart';

class noticeCard extends StatelessWidget {
  const noticeCard({
    Key? key,
    required this.newNotice,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> newNotice;

  @override
  Widget build(BuildContext context) {
    List<dynamic> SavedBy = newNotice.data()['SavedBy'] ?? [];
    var MSize = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.grey,
      onTap: () {
        Navigator.pushNamed(context, noticeScreen.route, arguments: newNotice);
      },
      child: Card(
        color: const Color.fromRGBO(11, 10, 10, 1),
        child: Container(
          width: MSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newNotice.data()['Department'],
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MSize.height * 0.01,
                  ),
                  Text(
                    // DateFormat.Hm().format(newNotice[i].date) +
                    //     " " +
                    DateFormat('d MMM y').format(DateTime.parse(
                        newNotice.data()['Time'].toDate().toString())),
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: MSize.height * 0.01,
                  ),
                  Container(
                    // color: Colors.amber,
                    width: MSize.width * 0.7,
                    child: AutoSizeText(
                      newNotice.data()['Title'],
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      minFontSize: 14,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    DateFormat.Hm().format(DateTime.parse(
                        newNotice.data()['Time'].toDate().toString())),
                    style: const TextStyle(color: Colors.white),
                  ),
                  SavedBy.contains(FirebaseAuth.instance.currentUser!.uid)
                      ? IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("Notices")
                                .doc(newNotice.id)
                                .update({
                              "SavedBy": FieldValue.arrayRemove(
                                  [FirebaseAuth.instance.currentUser!.uid])
                            });
                          },
                          icon: const Icon(Icons.bookmark, color: Colors.pink))
                      : IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("Notices")
                                .doc(newNotice.id)
                                .update({
                              "SavedBy": FieldValue.arrayUnion(
                                  [FirebaseAuth.instance.currentUser!.uid])
                            });
                          },
                          icon: const Icon(Icons.bookmark_border_outlined,
                              color: Colors.pink)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
