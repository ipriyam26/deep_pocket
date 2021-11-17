import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/admin.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_create.dart';
// import 'package:deep_pocket/screens/event/mock_event.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_model.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'notice_card.dart';

// import 'filter_widget.dart';

class noticeBoard extends StatefulWidget {
  const noticeBoard({Key? key}) : super(key: key);
  static const route = '/noticeboard';

  @override
  State<noticeBoard> createState() => _noticeBoardState();
}

class _noticeBoardState extends State<noticeBoard> {
  int fil = -1;
  int cata = 0;
  // var newNotice;
  ScrollController _scrollController = ScrollController();
  DateTime? _selected;
  DateTime? _selectedBefore;
  bool _isSearching = false;
  String? search;
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
    if (fil != -1) {
      return Notice.where("Department", isEqualTo: Department[fil])
          .orderBy("Time", descending: true)
          .limit(currentmax)
          .snapshots();
    }
    if (search != null) {
      return Notice.where("Title", isGreaterThanOrEqualTo: search)
          // .orderBy("Time", descending: true)
          .limit(currentmax)
          .snapshots();
    }

    if (_selected != null && _selectedBefore != null) {
      return Notice.where("Time", isGreaterThanOrEqualTo: _selectedBefore)
          .where("Time", isLessThan: _selected)
          .orderBy("Time", descending: true)
          .limit(currentmax)
          .snapshots();
    }

    if (_selected != null) {
      print("date after");
      return Notice.where("Time", isGreaterThanOrEqualTo: _selected)
          .orderBy("Time", descending: true)
          .limit(currentmax)
          .snapshots();
    }
    if (_selectedBefore != null) {
      print("date before");
      return Notice.where("Time", isLessThanOrEqualTo: _selectedBefore)
          .orderBy("Time", descending: true)
          .limit(currentmax)
          .snapshots();
    }

    return Notice.orderBy("Time", descending: true)
        .limit(currentmax)
        .snapshots();
  }

  int _value = -1;

  void updateFilter(tx, context) {
    setState(() {
      fil = tx;
    });

    Navigator.of(context).pop();
  }

  Future<Null> _selectTime(BuildContext context) async {
    final DateTime? picked_s = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (picked_s != null) {
      setState(() {
        _selected = picked_s;
      });
      Navigator.maybePop(context);
    }
  }

  List<dynamic> Admins = [];

  Future<Null> _selectBeforeTime(BuildContext context) async {
    final DateTime? picked_s = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (picked_s != null) {
      setState(() {
        _selectedBefore = picked_s;
      });
      Navigator.maybePop(context);
    }
  }

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
                title: const Text("Noticeboard"),
                actions: [
                  if (usercontroller.instructor!
                      .contains(FirebaseAuth.instance.currentUser!.uid))
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, createNotice.route);
                        },
                        icon: Icon(Icons.add)),
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  )
                ],
                backgroundColor: const Color.fromRGBO(16, 15, 1, 1)),
            backgroundColor: Colors.black,
            endDrawer: Drawer(
                child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
                title: const Text('FILTERS'),
              ),
              body: Container(
                color: Colors.black,
                child: Row(
                  children: [
                    Container(
                      height: MSize.height,
                      // color: Colors.amber,
                      width: MSize.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: MSize.height * 0.01),
                            child: const Text("Categories",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  cata = 0;
                                });
                              },
                              child: Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: const Text('Date',
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 17,
                                      )))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  cata = 1;
                                });
                              },
                              child: Container(
                                  // padding: const EdgeInsets.symmetric(vertical: ),
                                  child: const Text('Depatment',
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 17,
                                      ))))
                        ],
                      ),
                    ),
                    Container(
                      color: const Color(0xFF262626),
                      height: MSize.height * 0.8,
                      child: cata == 0
                          ? Container(
                              width: MSize.width * 0.47,
                              margin: EdgeInsets.symmetric(
                                vertical: MSize.height * 0.05,
                              ),
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: MSize.width * 0.1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.black,
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "After Date",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                          child: _selected != null
                                              ? Text(
                                                  DateFormat.yMd()
                                                      .format(_selected!),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      // backgroundColor: Colors.grey,
                                                      color: Colors.white),
                                                )
                                              : const Text(
                                                  "Pick a date",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      height: 1.5,
                                                      // backgroundColor: Colors.grey,
                                                      color: Colors.white),
                                                ),
                                          onPressed: () async {
                                            _selectTime(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MSize.height * 0.01,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.black,
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Before Date",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                          child: _selectedBefore != null
                                              ? Text(
                                                  DateFormat.yMd()
                                                      .format(_selectedBefore!),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      // backgroundColor: Colors.grey,
                                                      color: Colors.white),
                                                )
                                              : const Text(
                                                  "Pick a date",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      height: 1.5,
                                                      // backgroundColor: Colors.grey,
                                                      color: Colors.white),
                                                ),
                                          onPressed: () async {
                                            _selectBeforeTime(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _selected = null;
                                          _selectedBefore = null;
                                        });
                                        // updateFilter(-1, context);
                                      },
                                      child: const Text('Reset'))
                                ],
                              ))
                          : Container(
                              // color: Colors.amber,
                              child: Container(
                                margin:
                                    EdgeInsets.only(top: MSize.height * 0.02),
                                // height: MSize.height * 0.7,
                                child: Column(
                                  children: <Widget>[
                                    for (int i = -1; i < Department.length; i++)
                                      Container(
                                        width: MSize.width * 0.47,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.white),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            title: i == -1
                                                ? const Text(
                                                    "All",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    // style: Theme.of(context).textTheme.subtitle1.copyWith(color: i == 5 ? Colors.black38 : Colors.black),
                                                  )
                                                : Text(
                                                    Department[i],
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    // style: Theme.of(context).textTheme.subtitle1.copyWith(color: i == 5 ? Colors.black38 : Colors.black),
                                                  ),
                                            leading: Radio(
                                              value: i,
                                              groupValue: _value,
                                              activeColor: Colors.orange,
                                              onChanged: (int? value) {
                                                setState(() {
                                                  _value = value!;
                                                });
                                                updateFilter(_value, context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _value = -1;
                                          });
                                          updateFilter(-1, context);
                                        },
                                        child: Text('Reset'))
                                  ],
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            )),
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
                      ? Container(
                          child: Column(
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search_outlined,
                                      color: Colors.black),
                                  prefix: Text('Search: ',
                                      style: TextStyle(color: Colors.black)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                onSubmitted: (value) {
                                  setState(() {
                                    search = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: MSize.height * 0.01,
                              ),
                              Container(
                                height: MSize.height * 0.8,
                                // color: Colors.amber,
                                child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: noticeData.length,
                                    itemBuilder: (context, i) =>
                                        noticeCard(newNotice: noticeData[i])),
                              )
                            ],
                          ),
                        )
                      : Container(
                          // color: Colors.amber,
                          child: ListView.builder(
                              controller: _scrollController,
                              itemCount: noticeData.length,
                              itemBuilder: (context, i) =>
                                  noticeCard(newNotice: noticeData[i])),
                        );
                }),
          );
        });
  }
}
