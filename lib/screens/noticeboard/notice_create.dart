import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class createNotice extends StatefulWidget {
  static const route = 'noticeboard-Home/notice-create';

  @override
  _createNoticeState createState() => _createNoticeState();
}

class _createNoticeState extends State<createNotice> {
  List<String> Department = [
    'Student Affairs',
    'Acadamics',
    'Admin',
    "Central Libray",
    'Construction',
    'Design Innovation',
    'Finance',
    'Sports',
    'Dean'
  ];
  List<File> image = [];
  var _chosenValue = 'Acadamics';

  final titleController = TextEditingController();
  final senderController = TextEditingController();
  final bodyController = TextEditingController();
  // CollectionReference userCollection =
  //     FirebaseFirestore.instance.collection("users");

  int cata = 0;
  int _value = 0;
  double radius = 18;
  List<String> ImageLink = [];
  bool _posting = false;

  List<String> searchItem(List<String> value) {
    List<String> data = [];
    String word = "";
    for (int i = 0; i < value.length; i++) {
      // for (int j = 0; j <= i; j++) {
      word = word + " " + value[i];
      // }
      data.add(word);
    }
    return data;
  }

  void submitted() async {
    String titleCheck = titleController.text;
    String bodyCheck = bodyController.text;
    int tag = Department.indexOf(_chosenValue);
    if (titleCheck.isEmpty || bodyCheck.length < 10) {
      return;
    }
    setState(() {
      _posting = true;
    });
    List<String> value = titleController.text.split(" ").toList();
    List<String> yolo = bodyController.text.split(" ").toList();
    List<String> name = searchItem(value);
    List<String> enrollment = searchItem(yolo);

    List<String> finale = [...name, ...enrollment, ...value, ...yolo];
    var newNotice = {
      'AuthorUID': user!.uid,
      'Time': DateTime.now(),
      'Title': titleController.text,
      'Body': bodyController.text,
      'Sender': senderController.text,
      'Department': _chosenValue,
      'searchItems': finale
    };
    await FirebaseFirestore.instance
        .collection("Notices")
        .add(newNotice)
        .then((value) => print(value));

    //Sending newPost to previous page via Navigator.
    // context.read<mockData>().addPost(newPost as dataFeed);
    Navigator.of(context).pop(); //<- Attention
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    senderController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final MWidth = MediaQuery.of(context).size.width;
    final Mheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff171717),
        title: const Text('Post A Notice'),
        actions: [
          IconButton(onPressed: submitted, icon: const Icon(Icons.send))
        ],
      ),
      backgroundColor: const Color(0xff080808),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: Mheight * 0.12,
                      child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        controller: titleController,
                        maxLength: 200,
                        autocorrect: false,
                        scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                        // onChanged: (value){
                        //   titleController = value;

                        validator: (value) {
                          if (value!.length <= 20) {
                            return ("Title should be at least 20 Characters");
                          }
                        },
                        // },

                        decoration: const InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: "Title",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Mheight * 0.01,
                    ),
                    Container(
                      height: Mheight * 0.08,
                      child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        controller: senderController,
                        maxLength: 50,
                        autocorrect: false,
                        scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                        // onChanged: (value){
                        //   titleController = value;

                        validator: (value) {
                          if (value!.length <= 5) {
                            return ("Sender should be at least 5 Characters");
                          }
                        },
                        // },

                        decoration: const InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: "Sender Detail",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: Mheight * 0.35,
                      child: TextFormField(
                        maxLength: 1500,
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        controller: bodyController,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: "Notice Body",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            )),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Container(
                      width: MWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Department: ",
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          DropdownButton<String>(
                            focusColor: Colors.black,
                            value: _chosenValue,
                            dropdownColor: Colors.black,
                            elevation: 0,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            iconEnabledColor: Colors.orange,
                            items: Department.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  child: Text(
                                    value,
                                    style:
                                        const TextStyle(color: Colors.orange),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _chosenValue = value.toString();
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_posting)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Container(
                  height: Mheight * 0.1,
                  width: Mheight * 0.1,
                  child: const CircularProgressIndicator(
                    color: Colors.orange,
                    strokeWidth: 7,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
