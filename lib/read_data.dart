import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/course_read.dart';

class sendData {
  Future<List<Course>> ReadJsonData() async {
    final jsonData =
        await rootBundle.loadString('json-files/Language Learning.json');

    return courseFromJson(jsonData);
  }
}
