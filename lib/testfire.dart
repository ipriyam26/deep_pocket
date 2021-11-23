import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class testFire extends StatelessWidget {
  const testFire({Key? key}) : super(key: key);

  Future<QuerySnapshot<Map<String, dynamic>>> search() async {
    return await FirebaseFirestore.instance.collection("users").get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: search(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ElevatedButton(
                  onPressed: () async {
                    var data = snapshot.data!.docs;
                    for (var i = 0; i < data.length; i++) {
                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(data[i].id)
                          .update({'Points': 50});
                    }
                    Fluttertoast.showToast(msg: "Done");
                  },
                  child: Text("Press"));
            }),
      ),
    );
  }

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
}
