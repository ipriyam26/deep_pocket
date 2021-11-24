import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  Future<QuerySnapshot<Map<String, dynamic>>>? snapshot;
  QuerySnapshot<Map<String, dynamic>>? snapshotNoFuture;

  @override
  void onInit() {
    super.onInit();
    fetchAllEvents();
    fetchEvents2();
  }

  Future<void> fetchAllEvents() async {
    var data = FirebaseFirestore.instance
        .collection("Events")
        .where('EndingDate', isGreaterThanOrEqualTo: DateTime.now())
        .get();
    snapshot = data;
    update();
  }

  Future<void> fetchEvents2() async {
    var data = await FirebaseFirestore.instance.collection("Events").get();
    snapshotNoFuture = data;
    update();
  }
}
