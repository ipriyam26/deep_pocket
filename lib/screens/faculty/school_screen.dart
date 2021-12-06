// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:unique_list/unique_list.dart';

import 'package:deep_pocket_1/screens/faculty/faculty_model.dart';
import 'package:deep_pocket_1/screens/faculty/faculty_widgets.dart';

class schoolScreen extends StatelessWidget {
  const schoolScreen({Key? key}) : super(key: key);
  static const route = "/faculty-screen/school-screen";

  @override
  Widget build(BuildContext context) {
    final MHeight = MediaQuery.of(context).size.height;
    final MWidth = MediaQuery.of(context).size.width;
    final schoolName = ModalRoute.of(context)!.settings.arguments as String;
    // final Mheight = MediaQuery.of(context).size.height;
    // final Mwidth = MediaQuery.of(context).size.width;

    final teachers = Faculty_mock()
        .mockF
        .where((teacher) => teacher.School == schoolName)
        .toList();
    var dep = UniqueList<String>();

    for (int i = 0; i < teachers.length; i++) {
      dep.add(teachers[i].Department);
    }
    print(dep.length);
    final head = teachers.where((teachers) {
      if (teachers.Designation.contains('Head') ||
          teachers.Designation.contains('Dean') ||
          teachers.Designation.contains('Chair')) {
        return true;
      } else {
        return false;
      }
    }).toList();

    final hod = teachers.where((teachers) {
      if (teachers.Designation.contains('HOD')) {
        if (teachers.Designation.contains('Head') ||
            teachers.Designation.contains('Dean') ||
            teachers.Designation.contains('Chair')) {
          return false;
        }
        return true;
      }
      return false;
    }).toList();

    final professor = teachers.where((teachers) {
      if (teachers.Designation == 'Professor') {
        return true;
      }
      return false;
    }).toList();

    final AssosiateAsistant = teachers.where((teachers) {
      if (teachers.Designation.contains('Assistant') ||
          teachers.Designation.contains('Associate')) {
        return true;
      }
      return false;
    }).toList();

    return Scaffold(
      // endDrawer: Drawer(),
      // appBar: AppBar(title: ,),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MWidth * 0.01),

            // height: MHeight,
            child: Column(
              children: [
                SizedBox(
                  height: MHeight * 0.05,
                ),
                if (head.isNotEmpty)
                  deansCard(
                      MWidth: MWidth,
                      MHeight: MHeight,
                      head: head,
                      heading: 'Dean',
                      headingSize: 27),
                if (hod.isNotEmpty)
                  deansCard(
                    MWidth: MWidth,
                    MHeight: MHeight,
                    head: hod,
                    heading: 'HOD',
                    headingSize: 23,
                  ),
                if (professor.isNotEmpty)
                  deansCard(
                    MWidth: MWidth,
                    MHeight: MHeight,
                    head: professor,
                    heading: 'Professor',
                    headingSize: 20,
                  ),
                if (AssosiateAsistant.isNotEmpty)
                  deansCard(
                    MWidth: MWidth,
                    MHeight: MHeight,
                    head: AssosiateAsistant,
                    heading: 'Assosiate & Asistant Professors',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
