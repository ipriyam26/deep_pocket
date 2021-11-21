// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:deep_pocket_1/screens/faculty/faculty_widgets.dart';

import 'package:flutter/material.dart';

class school {
  String name;
  String Image;

  school({
    required this.name,
    required this.Image,
  });
}

class facultyScreen extends StatefulWidget {
  static const route = '/facultyScreen';

  const facultyScreen({Key? key}) : super(key: key);

  @override
  State<facultyScreen> createState() => _facultyScreenState();
}

class _facultyScreenState extends State<facultyScreen> {
  final schools = [
    school(
      name: "School of Engineering and Applied Sciences",
      Image:
          "https://www.nesfircroft.com/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBem1CQkE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--10e07b6f9aa62c88d4b28278c188db67d45cf07d/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9MY21WemFYcGxTU0lOT1RBd2VEUTFNRHdHT2daRlZBPT0iLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--a9eaf03facd434a9a6037440c56061f287102e69/Engineer's%20Mindset.jpg",
    ),
    school(
        name: "School of Law",
        Image:
            'https://img.jagranjosh.com/images/2021/August/1082021/Laws-Rights.webp'),
    school(
        name: "School of Management",
        Image:
            "https://previews.123rf.com/images/melpomen/melpomen2001/melpomen200100547/137647834-document-management-system-concept-with-businessman-on-night-city-background.jpg"),
    school(
        name: "Times School of Media",
        Image:
            "https://blog.verifirst.com/hs-fs/hubfs/Blog_Images/Social%20Media%20Background%20Check%20for%20New%20Hires.png?width=1660&name=Social%20Media%20Background%20Check%20for%20New%20Hires.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final MHeight = MediaQuery.of(context).size.height;
    final MWidth = MediaQuery.of(context).size.width;
    bool _isSearching = false;
    if (_isSearching != false) {}
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: MWidth * 0.05,
                ),
                width: MWidth,
                child: const Text('Faculty',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: MHeight * 0.01,
              ),
              SizedBox(
                height: MHeight * 0.8,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: schools.length,
                    itemBuilder: (context, i) => cardList(
                        MWidth: MWidth, MHeight: MHeight, sch: schools[i])),
              ),
            ],
          ),
        ));
  }
}
