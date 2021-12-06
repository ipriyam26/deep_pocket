// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class userRoleController extends GetxController {
  List<dynamic>? admins = [];
  List<dynamic>? instructor = [];
  List<dynamic>? specialAccess = [];

  @override
  void onInit() {
    super.onInit();
    fetchAdmins();
    fetchInstructor();
  }

  void fetchAdmins() async {
    var list =
        await FirebaseFirestore.instance.collection("Roles").doc("Admin").get();
    admins!.addAll(list.data()!['User']);
    specialAccess!.addAll(list.data()!['User']);
    update();
  }

  void fetchInstructor() async {
    var list = await FirebaseFirestore.instance
        .collection("Roles")
        .doc("Instructor")
        .get();
    instructor!.addAll(list.data()!['User']);
    specialAccess!.addAll(list.data()!['User']);
    update();
  }
}
