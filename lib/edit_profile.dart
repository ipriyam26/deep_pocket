import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'models/user_model.dart';

class editProfile extends StatefulWidget {
  static const route = 'editProfile';
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  User? user = FirebaseAuth.instance.currentUser;
  String? Imagelink = null;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      Imagelink = loggedInUser.Image;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    });
  }

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
    var name = loggedInUser.Name;

    String? college = loggedInUser.CollegeName;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  if (loggedInUser.Image == null)
                    Container(
                      width: MediaQuery.of(context).size.height * 0.20,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlue,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "http://simpleicon.com/wp-content/uploads/user1.png"))),
                    )
                  else
                    Container(
                      width: MediaQuery.of(context).size.height * 0.20,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlue,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(Imagelink!))),
                    ),
                  ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      // width: MediaQuery.of(context).size.width * 0.13,
                      // height: MediaQuery.of(context).size.width * 0.13,
                      color: Colors.white,
                      child: ClipOval(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.11,
                        color: Colors.lightBlue,
                        child: IconButton(
                            onPressed: uploadImage,
                            icon: Icon(Icons.edit, color: Colors.white)),
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
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
      final tempImage = File(newimage.path);
      // final PermaImage = await saveImagePermanently(image.path);
      print(newimage.path);
      var link = await API_Manager().postImage(newimage.path);
      UserModel userModel = UserModel();

      setState(() async {
        userModel.Image = link;
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        print(userModel);
        await firebaseFirestore
            .collection("users")
            .doc(user!.uid)
            .set(userModel.toMap());
        Fluttertoast.showToast(msg: "Account created successfully :) ");
      });

      // var link = await API_Manager().postImage(newimage.path);
      // setState(() {
      //   ImageLink.add(link);
      // });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _pickImage() async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (newimage == null) {
        print("object");
        return;
      }
      final tempImage = File(newimage.path);
      // final PermaImage = await saveImagePermanently(image.path);
      var link = await API_Manager().postImage(newimage.path);
      UserModel userModel = UserModel();
      userModel.Image = link;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      print(userModel.Image);
      await firebaseFirestore
          .collection("users")
          .doc(user!.uid)
          .set(userModel.toMap());
      Fluttertoast.showToast(msg: "Account created successfully :) ");
      setState(() {
        // image = tempImage;
        Imagelink = link;
      });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
