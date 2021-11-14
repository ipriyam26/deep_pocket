import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
// import 'package:email_password_login/model/user_model.dart';
// import 'package:email_password_login/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import 'verification_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late SharedPreferences localStorage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  String? imageLink;
  File? profileImage;
  final NameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final collegeEditingController = new TextEditingController();
  final enrollmentNoEditingController = new TextEditingController();

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

      setState(() async {
        profileImage = tempImage;
        Fluttertoast.showToast(msg: "Photo uploaded successfully :) ");
      });
      Navigator.maybePop(context);
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
      print(e);
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
          RegExp regex = new RegExp(r'^.{3,}$');
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
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintStyle: TextStyle(color: Colors.white),
          hintText: "Full Name",
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.black)),
        ));

    final CollegeNameField = TextFormField(
        autofocus: false,
        controller: collegeEditingController,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.white),
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
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            Icons.school,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        style: TextStyle(color: Colors.white),
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
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            Icons.fingerprint,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enrollment Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        style: TextStyle(color: Colors.white),
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        style: TextStyle(color: Colors.white),
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        style: TextStyle(color: Colors.white),
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    final profileImageU = Stack(
      alignment: Alignment.bottomRight,
      children: [
        if (profileImage == null)
          Container(
            width: MediaQuery.of(context).size.height * 0.20,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://www.ddugpgcsitapur.com/alumni/image.png",
                  ),
                )),
          )
        else
          Container(
            width: MediaQuery.of(context).size.height * 0.20,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlue,
                image: DecorationImage(
                    fit: BoxFit.cover, image: FileImage(profileImage!))),
          ),
        ClipOval(
          child: Container(
            padding: EdgeInsets.all(2),
            // width: MediaQuery.of(context).size.width * 0.13,
            // height: MediaQuery.of(context).size.width * 0.13,
            color: Colors.white,
            child: ClipOval(
                child: Container(
              width: MediaQuery.of(context).size.width * 0.11,
              color: Colors.black,
              child: IconButton(
                  onPressed: uploadImage,
                  icon: Icon(Icons.add_a_photo, color: Colors.white)),
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
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          minWidth: MediaQuery.of(context).size.width * 0.7,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: const Text(
            "Confirm Email",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // profileImageU,
                    SizedBox(height: 30),
                    // firstNameField,
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.black,
                        child: ClipOval(
                            child: Image.asset(
                          'assets/logo.png',
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                        )),
                      ),
                    ),
                    SizedBox(height: 50),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 100),
                    // CollegeNameField,
                    // SizedBox(height: 20),
                    // enrollmentNameField,
                    // SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    var errorMessage;
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e.toString());
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // User? user = _auth.currentUser;

    // UserModel userModel = UserModel();
    // var link = await API_Manager().postImage(imageLink!);

    // // writing all the values
    // userModel.email = user!.email;
    // userModel.uid = user.uid;
    // userModel.Name = NameEditingController.text;
    // userModel.Image = link;
    // userModel.CollegeName = collegeEditingController.text;
    // userModel.enrollmentNo = enrollmentNoEditingController.text;

    // await firebaseFirestore
    //     .collection("users")
    //     .doc(user.uid)
    //     .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
    localStorage = await SharedPreferences.getInstance();

    localStorage.setString('email', emailEditingController.text.toString());
    localStorage.setString(
        'password', passwordEditingController.text.toString());

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => verification()),
        (route) => false);
  }
}
