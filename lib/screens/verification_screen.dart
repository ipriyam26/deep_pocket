import 'dart:async';

import 'package:deep_pocket_1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class verification extends StatefulWidget {
  verification({Key? key}) : super(key: key);

  @override
  _verificationState createState() => _verificationState();
}

class _verificationState extends State<verification> {
  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    user = auth.currentUser;
    user!.sendEmailVerification();
    Timer.periodic(Duration(seconds: 5), (timer) {
      checkVerification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        // width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verifying".toUpperCase(),
              style: const TextStyle(
                  fontSize: 32,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text(
              "Please Check Your entered Email, and Click the link to verify",
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Text(
              "This might take a while",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Future<void> checkVerification() async {
    user = auth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      // timer!.cancel();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
    }
  }
}
