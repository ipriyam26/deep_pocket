// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:deep_pocket_1/getcourse.dart';
// import 'package:deep_pocket_1/models/course_read.dart';
// import 'package:deep_pocket_1/read_data.dart';
// import 'package:deep_pocket_1/screens/event/get_event.dart';
// import 'package:deep_pocket_1/widgets/read_moredata.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// class test_fire extends StatefulWidget {
//   const test_fire({Key? key}) : super(key: key);

//   @override
//   State<test_fire> createState() => _test_fireState();
// }

// Future<void> printdata() async {
//   List<Course> data = await sendmoreData().ReadJsonMoreData();
//   for (int i = 0; i < data.length; i++) {
//     print(data[i].name);
//   }
// }

// class _test_fireState extends State<test_fire> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("YOLO"),
//       ),
//       body: Container(
//         child: ElevatedButton(
//           child: Text("efef"),
//           onPressed: printdata,
//         ),
//       ),
//     );
//   }
// }
