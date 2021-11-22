import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/admin.dart';
import 'package:deep_pocket_1/screens/internship/internship_create.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:deep_pocket_1/screens/internship/half_widgets.dart';
import 'package:get/get.dart';

class internShips extends StatelessWidget {
  static const route = '/internships';

  Future<QuerySnapshot<Map<String, dynamic>>> getInternships() async {
    return FirebaseFirestore.instance
        .collection("Internships")
        .orderBy("StartingDate", descending: false)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: userRoleController(),
        builder: (userRoleController roleController) {
          return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                actions: [
                  if (roleController.specialAccess!
                      .contains(FirebaseAuth.instance.currentUser!.uid))
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, internCreate.route);
                        },
                        icon: Icon(Icons.add))
                ],
                backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
                title: const Text("Interships"),
              ),
              body: FutureBuilder(
                  future: getInternships(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) => internshipCard(
                              internship: snapshot.data!.docs[index].data())),
                    );
                  }));
        });
  }
}
