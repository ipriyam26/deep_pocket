import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/screens/Nearby/nearby_first.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class nearbyFav extends StatelessWidget {
  Future<QuerySnapshot<Map<String, dynamic>>> getFavPlace() async {
    return FirebaseFirestore.instance
        .collection("Nearby")
        .where("SavedBy", arrayContains: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
        title: const Text("Favourite"),
      ),
      body: FutureBuilder(
          future: getFavPlace(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var data = snapshot.data!.docs;
            return ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => nearbyCard(data: data[index]));
          }),
    );
  }
}
