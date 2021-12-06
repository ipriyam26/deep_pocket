// ignore_for_file: constant_identifier_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

List<String> Tag = [
  'all',
  'Query',
  'Games',
  'Doubt',
  'Selling',
  'CabShare',
  'Announcement',
  'OpenDiscussion',
];

class dataFeed with ChangeNotifier {
  final String id;
  final String name;
  final String title;
  final String text;
  final String imgsrc;
  final String date;
  final int tag;

  dataFeed({
    required this.id,
    required this.imgsrc,
    required this.name,
    required this.title,
    this.tag = 0,
    required this.text,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'imgsrc': imgsrc,
        'name': name,
        'title': title,
        'text': text,
        'tag': tag,
        'date': date,
      };
}
