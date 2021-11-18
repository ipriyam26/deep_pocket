import 'package:deep_pocket_1/models/course_read.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  List<Course> CourseList = [];

  @override
  void onInit() {
    super.onInit();
    ReadJsonData();
  }

  Future<void> ReadJsonData() async {
    final jsonData = await rootBundle.loadString('jsondata/course_new.json');

    CourseList = courseFromJson(jsonData);
    update();
  }
}
