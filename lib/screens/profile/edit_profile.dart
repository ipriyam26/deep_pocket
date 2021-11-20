import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/user_model.dart';

class editProfile extends StatefulWidget {
  static const route = 'editProfile';
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  User? user = FirebaseAuth.instance.currentUser;
  String? Imagelink = null;
  final NameEditingController = new TextEditingController();
  final collegeEditingController = new TextEditingController();
  final enrollmentNoEditingController = new TextEditingController();
  final db = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    NameEditingController.dispose();
    collegeEditingController.dispose();
    enrollmentNoEditingController.dispose();

    super.dispose();
  }

  bool _waiting = false;
  void uploadImage() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                // IconButton(onPressed: _pickImage, icon: icon)
                TextButton.icon(
                    onPressed: () async {
                      await _pickImage();
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("Open Gallery")),
                TextButton.icon(
                    onPressed: _pickImageCamera,
                    icon: const Icon(Icons.camera),
                    label: const Text("Take A Picture")),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Mheight = MediaQuery.of(context).size.height;
    final Mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: StreamBuilder(
              stream: db.collection("users").doc(user!.uid).get().asStream(),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var userdata = snapshot.data!.data();
                NameEditingController.text = userdata!['Name'];
                collegeEditingController.text = userdata['CollegeName'];
                enrollmentNoEditingController.text = userdata['enrollmentNo'];
                // collegeEditingController.text = userdata!['CollegeName'];
                // enrollmentNoEditingController.text = userdata!['enrollementNo'];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: Mwidth * 0.05),
                  child: _waiting
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  if (userdata['Image'] == null)
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.lightBlue,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "http://simpleicon.com/wp-content/uploads/user1.png"))),
                                    )
                                  else
                                    ClipOval(
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        color: Colors.black,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.20,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      userdata['Image']!))),
                                        ),
                                      ),
                                    ),
                                  ClipOval(
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      // width: MediaQuery.of(context).size.width * 0.13,
                                      // height: MediaQuery.of(context).size.width * 0.13,
                                      color: Colors.white,
                                      child: ClipOval(
                                          child: Container(
                                        width: Mwidth * 0.11,
                                        color: Colors.black,
                                        child: IconButton(
                                            onPressed: uploadImage,
                                            icon: const Icon(Icons.edit,
                                                color: Colors.pink)),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Mheight * 0.05,
                              ),
                              TextFormField(
                                  autofocus: false,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'^.{3,}$');
                                    if (value!.isEmpty) {
                                      return ("First Name cannot be Empty");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter Valid name(Min. 3 Character)");
                                    }
                                    return null;
                                  },
                                  initialValue: userdata['Name'],
                                  onChanged: (value) {
                                    NameEditingController.text = value;
                                  },
                                  textInputAction: TextInputAction.next,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.account_circle,
                                      color: Colors.white,
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 15, 20, 15),
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    // hintText: "Full Name",
                                    filled: true,
                                    fillColor: Colors.black,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  )),
                              SizedBox(
                                height: Mheight * 0.02,
                              ),
                              TextFormField(
                                  initialValue: userdata['CollegeName'],
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(color: Colors.white),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Institute Name cannot be Empty");
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    collegeEditingController.text = value;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    prefixIcon: const Icon(
                                      Icons.school,
                                      color: Colors.white,
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 15, 20, 15),
                                    filled: true,
                                    fillColor: Colors.black,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  )),
                              SizedBox(
                                height: Mheight * 0.02,
                              ),
                              TextFormField(
                                  initialValue: userdata['enrollmentNo'],
                                  autofocus: false,
                                  style: const TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Enrollment Number cannot be Empty");
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    enrollmentNoEditingController.text = value;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    prefixIcon: const Icon(
                                      Icons.fingerprint,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.black,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 15, 20, 15),
                                    // hintText: "Enrollment Number",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  )),
                              SizedBox(
                                height: Mheight * 0.05,
                              ),
                              Container(
                                width: Mwidth * 0.4,
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.purple,
                                  child: MaterialButton(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 15, 20, 15),
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      onPressed: () async {
                                        setState(() {
                                          _waiting = true;
                                        });

                                        List<String> value =
                                            NameEditingController.text
                                                .split("")
                                                .toList();
                                        List<String> yolo =
                                            enrollmentNoEditingController.text
                                                .split("")
                                                .toList();
                                        List<String> name = searchItem(value);
                                        List<String> enrollment =
                                            searchItem(yolo);

                                        List<String> finale = [
                                          ...name,
                                          ...enrollment
                                        ];

                                        await db
                                            .collection("users")
                                            .doc(user!.uid)
                                            .update({
                                          'Name': NameEditingController.text,
                                          'CollegeName':
                                              collegeEditingController.text,
                                          'enrollmentNo':
                                              enrollmentNoEditingController
                                                  .text,
                                          'searchItems': finale,
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Save",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                );
              }),
        ),
      ),
    );
  }

  List<String> searchItem(List<String> value) {
    List<String> data = [];
    String word = "";
    for (int i = 0; i < value.length; i++) {
      // for (int j = 0; j <= i; j++) {
      word = word + "" + value[i];
      // }
      data.add(word);
    }
    return data;
  }

  Future<void> _pickImageCamera() async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (newimage == null) {
        print("object");
        return;
      }
      print(newimage.path);
      var link = await API_Manager().postImage(newimage.path);
      await db.collection("users").doc(user!.uid).update({'Image': link});

      var postsToupdate = await db
          .collection("Posts")
          .where('AuthorUID', isEqualTo: user!.uid)
          .get();

      for (int i = 0; i < postsToupdate.docs.length; i++) {
        print("Post:" + postsToupdate.docs[i].id);
      }
      // WriteBatch postImageUpdate = db.batch();

      // postImageUpdate.update(document, data);

      // for (int i = 0; i < postsToupdate.docs.length;i++){
      // postsToupdate.docs[0].id;

      // }

      setState(() {});
      Fluttertoast.showToast(msg: "Image Updated SuccessFully");
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _pickImage() async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      Navigator.pop(context);
      if (newimage == null) {
        print("object");
        return;
      }
      var link = await API_Manager().postImage(newimage.path);

      await db.collection("users").doc(user!.uid).update({'Image': link});
      Fluttertoast.showToast(msg: "Image Updated SuccessFully");
      setState(() {
        Imagelink = link;
      });

      WriteBatch postImageUpdate = db.batch();
      var postsToupdate = await db
          .collection("Posts")
          .where('AuthorUID', isEqualTo: user!.uid)
          .get();

      postsToupdate.docs[0].reference;

      for (int i = 0; i < postsToupdate.docs.length; i++) {
        print("Post:" + postsToupdate.docs[i].id);
        // var docPath =
        //     db.doc(db.collection("Posts").doc(postsToupdate.docs[i].id).path);
        postImageUpdate.update(
            postsToupdate.docs[i].reference, {'AuthorProfilePic': link});
      }
      Fluttertoast.showToast(msg: "Post Author Image Updated SuccessFully");

      var commentsToupdate = await db
          .collection("Comments")
          .where("AuthorID", isEqualTo: user!.uid)
          .get();
      for (int i = 0; i < commentsToupdate.docs.length; i++) {
        print("Comments" + commentsToupdate.docs[i].id);
        // var docPath = db.doc(
        //     db.collection("Comments").doc(commentsToupdate.docs[i].id).path);
        postImageUpdate
            .update(commentsToupdate.docs[i].reference, {'AuthorPic': link});
      }
      postImageUpdate.commit();
      Fluttertoast.showToast(msg: "Comment Author Image Updated SuccessFully");
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
