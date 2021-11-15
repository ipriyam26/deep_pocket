import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class test_fire extends StatefulWidget {
  const test_fire({Key? key}) : super(key: key);

  @override
  State<test_fire> createState() => _test_fireState();
}

class _test_fireState extends State<test_fire> {
  Future<void> tryUpload() async {
    final value = await FirebaseFirestore.instance
        .collection("Courses")
        .doc("Design")
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YOLO"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Courses")
              .doc("Details")
              .collection("SubCatagory")
              .doc()
              .snapshots(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return Text("data");
            }
            // ignore: avoid_print
            print(snapshot.data.toString());
            return Container();
            // return Center(
            //   child: ListView.builder(
            //     itemCount: snapshot.data!.data()!.length,
            //     itemBuilder: (context, index) {
            //       print(snapshot.data!.data()![index].id);
            //       return Text(snapshot.data!.data()![index].id);
            //     },
            //   ),
            // );
          }),
    );
  }
}
