import 'dart:convert';

import 'package:deep_pocket_1/models/places.dart';
import 'package:flutter/services.dart';

import '../models/course_read.dart';

class sendData {
  Future<List<Course>> ReadJsonData(String path) async {
    final jsonData = await rootBundle.loadString(path);

    return courseFromJson(jsonData);
  }

  Future<List<Places>> ReadJson2Data(String path) async {
    final jsonData = await rootBundle.loadString(path);

    return placesFromJson(jsonData);
  }
}
