import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class testFire extends StatelessWidget {
  const testFire({Key? key}) : super(key: key);

  Future<QuerySnapshot<Map<String, dynamic>>> search() async {
    return await FirebaseFirestore.instance.collection("Notices").get();
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
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    List<String> value = snapshot.data!.docs[i]
                        .data()['Title']
                        .split(" ")
                        .toList();
                    List<String> yolo = snapshot.data!.docs[i]
                        .data()['Body']
                        .split(" ")
                        .toList();
                    List<String> name = searchItem(value);
                    List<String> enrollment = searchItem(yolo);

                    List<String> finale = [
                      ...name,
                      ...enrollment,
                      ...value,
                      ...yolo
                    ];
                    await FirebaseFirestore.instance
                        .collection("Notices")
                        .doc(snapshot.data!.docs[i].id)
                        .update({'searchItems': finale});
                    print("Done : " + snapshot.data!.docs[i].data()['Title']);
                  }
                },
                child: Text("Press"),
              );
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
