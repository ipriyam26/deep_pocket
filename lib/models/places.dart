// To parse this JSON data, do
//
//     final places = placesFromJson(jsonString);

import 'dart:convert';

List<Places> placesFromJson(String str) =>
    List<Places>.from(json.decode(str).map((x) => Places.fromJson(x)));

String placesToJson(List<Places> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Places {
  Places({
    required this.name,
    required this.address,
    required this.urls,
    required this.catagory,
  });

  String name;
  String address;
  String urls;
  String catagory;

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        name: json["Name"],
        address: json["Address"],
        urls: json["urls"],
        catagory: json["Catagory"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Address": address,
        "urls": urls,
        "Catagory": catagory,
      };
}
