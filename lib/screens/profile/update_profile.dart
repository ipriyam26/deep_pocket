// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:deep_pocket_1/screens/login-signup/login.dart';
import 'package:deep_pocket_1/tabs_screen.dart';
// import 'package:email_password_login/model/user_model.dart';
// import 'package:email_password_login/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/user_model.dart';
import '../login-signup/verification_screen.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _auth = FirebaseAuth.instance;

  // our form key

  final _formKey = GlobalKey<FormState>();
  // editing Controller
  String? imageLink;
  File? profileImage;
  var isLoading = false;
  final NameEditingController = TextEditingController();

  final collegeEditingController = TextEditingController();
  final enrollmentNoEditingController = TextEditingController();

  void uploadImage() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                // IconButton(onPressed: _pickImage, icon: icon)
                TextButton.icon(
                    onPressed: _pickImage,
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

  Future<void> _pickImageCamera() async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (newimage == null) {
        return;
      }
      final tempImage = File(newimage.path);
      // final PermaImage = await saveImagePermanently(image.path);

      setState(() async {
        profileImage = tempImage;
        Fluttertoast.showToast(msg: "Photo uploaded successfully :) ");
      });
      Navigator.maybePop(context);
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> _pickImage() async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (newimage == null) {
        return;
      }
      final tempImage = File(newimage.path);
      // final PermaImage = await saveImagePermanently(image.path);
      imageLink = newimage.path;
      // var link = await API_Manager().postImage(newimage.path);

      setState(() {
        // image = tempImage;
        // imageLink = link;
        profileImage = tempImage;
        Fluttertoast.showToast(msg: "Photo uploaded successfully :) ");
      });
      Navigator.maybePop(context);
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: NameEditingController,
        cursorColor: Colors.white,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          NameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintStyle: const TextStyle(color: Colors.white),
          hintText: "Full Name",
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black)),
        ));

    final CollegeNameField = TextFormField(
        autofocus: false,
        controller: collegeEditingController,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Institute Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          collegeEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: const Icon(
            Icons.school,
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Institute's Name",
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));
    final enrollmentNameField = TextFormField(
        autofocus: false,
        controller: enrollmentNoEditingController,
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("College Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          enrollmentNoEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: const Icon(
            Icons.fingerprint,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enrollment Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));
    final profileImageU = Stack(
      alignment: Alignment.bottomRight,
      children: [
        if (profileImage == null)
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(3.0),
              color: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.height * 0.20,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage('assets/person.png'),
                    )),
              ),
            ),
          )
        else
          ClipOval(
              child: Container(
            padding: const EdgeInsets.all(5.0),
            color: Colors.black,
            child: Container(
              width: MediaQuery.of(context).size.height * 0.20,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: FileImage(profileImage!))),
            ),
          )),
        ClipOval(
          child: Container(
            padding: const EdgeInsets.all(2),
            // width: MediaQuery.of(context).size.width * 0.13,
            // height: MediaQuery.of(context).size.width * 0.13,
            color: Colors.white,
            child: ClipOval(
                child: Container(
              width: MediaQuery.of(context).size.width * 0.11,
              color: Colors.black,
              child: IconButton(
                  onPressed: uploadImage,
                  icon: const Icon(Icons.add_a_photo, color: Colors.white)),
            )),
          ),
        )
      ],
    );
    //signup button

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.purple,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            await postDetailsToFirestore();
          },
          child: const Text(
            "Update",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        image: AssetImage('assets/background.jpg'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 36.0, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        profileImageU,
                        const SizedBox(height: 30),
                        firstNameField,
                        const SizedBox(height: 20),
                        CollegeNameField,
                        const SizedBox(height: 20),
                        enrollmentNameField,
                        const SizedBox(height: 100),
                        signUpButton,
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
              if (isLoading)
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                      child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  )),
                )
            ],
          ),
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

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    setState(() {
      isLoading = true;
    });
    UserModel userModel = UserModel();
    String? link;
    if (imageLink != null) {
      link = await API_Manager().postImage(imageLink!);
    }

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.Name = NameEditingController.text;
    userModel.Image = link ??
        "https://i.dlpng.com/static/png/5780540-person-icon-person-icon-silhouette-transparent-png-370x370-icon-person-820_450_preview.png";
    ;
    userModel.CollegeName = collegeEditingController.text;
    userModel.enrollmentNo = enrollmentNoEditingController.text;

    List<String> value = NameEditingController.text.split("").toList();
    List<String> yolo = enrollmentNoEditingController.text.split("").toList();
    List<String> name = searchItem(value);
    List<String> enrollment = searchItem(yolo);

    List<String> finale = [...name, ...enrollment];
    userModel.searchItems = finale;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .update(userModel.toMap());
    Fluttertoast.showToast(msg: "Profile Updated successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
