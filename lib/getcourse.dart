import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  Future<QuerySnapshot<Map<String, dynamic>>>? courseName;

  @override
  void onInit() {
    super.onInit();
    fetchCoursesName();
  }

  Future<void> fetchCoursesName() async {
    var data = FirebaseFirestore.instance.collection("Courses");
    courseName = data.get();
    print(data.doc().id);
    update();
  }
}
