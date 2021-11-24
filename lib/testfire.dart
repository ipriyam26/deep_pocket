// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:deep_pocket_1/models/places.dart';
// import 'package:deep_pocket_1/read_data.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class testFire extends StatelessWidget {
//   const testFire({Key? key}) : super(key: key);
//   Future<QuerySnapshot<Map<String, dynamic>>> getplaces() async {
//    return await FirebaseFirestore.instance.collection("Nearby").get();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: FutureBuilder(
//             future: getplaces(),
//             builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> places) {
//               if (!places.hasData) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }

//               return ElevatedButton(
//                   onPressed: () async {
//                     var data = places.data!.docs;
//                     for (var i = 0; i < data.length; i++) {
//                       if()
//                       await FirebaseFirestore.instance
//                           .collection("Nearby")
//                           .doc(data[i].id)
//                           .update({
//                         'Name': data[i].name,
//                         'Address': data[i].address,
//                         'Url': data[i].urls,
//                         'Catagory': data[i].catagory,
//                         'Rating': 0,
//                       });
//                     }
//                     Fluttertoast.showToast(msg: "Done");
//                   },
//                   child: Text("Press"));
//             }),
//       ),
//     );
//   }

//   List<String> searchItem(List<String> value) {
//     List<String> data = [];
//     String word = "";
//     for (int i = 0; i < value.length; i++) {
//       // for (int j = 0; j <= i; j++) {
//       word = word + " " + value[i];
//       // }
//       data.add(word);
//     }
//     return data;
//   }
// }
