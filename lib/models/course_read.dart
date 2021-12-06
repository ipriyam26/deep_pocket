// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);


import 'dart:convert';

List<Course> courseFromJson(String str) =>
    List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

class Course {
  Course({
    required this.name,
    required this.level,
    required this.desciption,
    required this.catagory,
    required this.subCatagory,
    required this.time,
    required this.provider,
    required this.source,
    required this.audit,
    required this.certificate,
    required this.courseLink,
    required this.enrolled,
    required this.rating,
    required this.image,
  });

  final String? name;
  final String? level;
  final String? desciption;
  final String? catagory;
  final String? subCatagory;
  final String? time;
  final String? provider;
  final String? source;
  final String? audit;
  final String? certificate;
  final String? courseLink;
  final dynamic enrolled;
  final dynamic rating;
  final String? image;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        name: json["name"],
        level: json["level"],
        desciption: json["desciption"],
        catagory: json["catagory"],
        subCatagory: json["subCatagory"],
        time: json["time"],
        provider: json["provider"],
        source: json["source"],
        audit: json["Audit"],
        certificate: json["certificate"],
        courseLink: json["courseLink"],
        enrolled: json["enrolled"],
        rating: json["rating"],
        image: json["image"],
      );
}
