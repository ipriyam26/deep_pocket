import 'dart:convert';

import 'package:deep_pocket_1/models/course_read.dart';
import 'package:flutter/services.dart';

class sendmoreData {
  Future<List<Course>> ReadJsonMoreData() async {
    final jsonData =
        await rootBundle.loadString('json-files/Computer Science.json');

    return courseFromJson(jsonData);
  }
}
