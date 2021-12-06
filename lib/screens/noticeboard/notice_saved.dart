// ignore_for_file: camel_case_types, unused_field, avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/admin.dart';

// import 'package:deep_pocket/screens/event/mock_event.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'notice_card.dart';
import 'notice_model.dart';

// import 'filter_widget.dart';

class noticeSaved extends StatefulWidget {
  const noticeSaved({Key? key}) : super(key: key);
  static const route = '/noticeSaved';

  @override
  State<noticeSaved> createState() => _noticeSavedState();
}

class _noticeSavedState extends State<noticeSaved> {
  int fil = -1;
  int cata = 0;
  // var newNotice;
  final ScrollController _scrollController = ScrollController();
  DateTime? _selected;
  DateTime? _selectedBefore;
  final bool _isSearching = false;
  String search = '';
  var currentmax = 20;
  Stream<QuerySnapshot<Map<String, dynamic>>> getStream() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("reached end");
        setState(() {
          currentmax = currentmax + 10;
        });
      }
    });

    final Notice = FirebaseFirestore.instance.collection("Notices");

    return Notice.where("SavedBy",
            arrayContains: FirebaseAuth.instance.currentUser!.uid)
        .orderBy("Time", descending: true)
        .limit(currentmax)
        .snapshots();
  }

  final int _value = -1;

  void updateFilter(tx, context) {
    setState(() {
      fil = tx;
    });

    Navigator.of(context).pop();
  }

  List<dynamic> Admins = [];

  Future<dynamic> getadmins() async {
    var list =
        await FirebaseFirestore.instance.collection("Roles").doc("Admin").get();
    var data = list.data()!['User'] as List<dynamic>;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var MSize = MediaQuery.of(context).size;
    var scaffoldKey = GlobalKey<ScaffoldState>();

    var newNotice = mockN().mockNotic;
    if (fil != -1) {
      newNotice = newNotice.where((element) => element.depNo == fil).toList();
    }
    // getadmins();

    return GetBuilder(
        init: userRoleController(),
        builder: (userRoleController usercontroller) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
                title: const Text("Saved"),
                backgroundColor: const Color.fromRGBO(16, 15, 1, 1)),
            backgroundColor: Colors.black,
            body: StreamBuilder(
                stream: getStream(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final noticeData = snapshot.data!.docs;

                  return _isSearching
                      ? Column(
                          children: [
                            TextField(
                              autocorrect: false,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search_outlined,
                                    color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onSubmitted: (String value) {
                                setState(() {
                                  search = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: MSize.height * 0.01,
                            ),
                            SizedBox(
                              height: MSize.height * 0.8,
                              // color: Colors.amber,
                              child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: noticeData.length,
                                  itemBuilder: (context, i) =>
                                      noticeCard(newNotice: noticeData[i])),
                            )
                          ],
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount: noticeData.length,
                          itemBuilder: (context, i) =>
                              noticeCard(newNotice: noticeData[i]));
                }),
          );
        });
  }
}
