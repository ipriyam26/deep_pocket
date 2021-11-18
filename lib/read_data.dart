import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/course_read.dart';

class sendData {
  Future<List<Course>> ReadJsonData(String path) async {
    final jsonData = await rootBundle.loadString(path);

    return courseFromJson(jsonData);
  }
}
