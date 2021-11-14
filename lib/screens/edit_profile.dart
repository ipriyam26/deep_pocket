import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                    onPressed: _pickImage,
                    icon: Icon(Icons.image),
                    label: Text("Open Gallery")),
                TextButton.icon(
                    onPressed: _pickImageCamera,
                    icon: Icon(Icons.camera),
                    label: Text("Take A Picture")),
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
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(user!.uid)
                  .get()
                  .asStream(),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
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
                                        padding: EdgeInsets.all(4),
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
                                      padding: EdgeInsets.all(4),
                                      // width: MediaQuery.of(context).size.width * 0.13,
                                      // height: MediaQuery.of(context).size.width * 0.13,
                                      color: Colors.white,
                                      child: ClipOval(
                                          child: Container(
                                        width: Mwidth * 0.11,
                                        color: Colors.black,
                                        child: IconButton(
                                            onPressed: uploadImage,
                                            icon: Icon(Icons.edit,
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
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Colors.white,
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 15, 20, 15),
                                    hintStyle: TextStyle(color: Colors.white),
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
                                  style: TextStyle(color: Colors.white),
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
                                    hintStyle: TextStyle(color: Colors.white),
                                    prefixIcon: Icon(
                                      Icons.school,
                                      color: Colors.white,
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                                  style: TextStyle(color: Colors.white),
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
                                    hintStyle: TextStyle(color: Colors.white),
                                    prefixIcon: Icon(
                                      Icons.fingerprint,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Colors.black,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                                      padding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      onPressed: () async {
                                        setState(() {
                                          _waiting = true;
                                        });
                                        await FirebaseFirestore.instance
                                            .collection("users")
                                            .doc(user!.uid)
                                            .update({
                                          'Name': NameEditingController.text,
                                          'CollegeName':
                                              collegeEditingController.text,
                                          'enrollmentNo':
                                              enrollmentNoEditingController.text
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
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .update({'Image': link});

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

      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .update({'Image': link});

      Fluttertoast.showToast(msg: "Image Updated SuccessFully");
      setState(() {
        Imagelink = link;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
