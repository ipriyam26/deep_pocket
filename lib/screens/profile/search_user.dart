import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/screens/profile/search_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SearchUser extends StatefulWidget {
  SearchUser({Key? key}) : super(key: key);
  static const route = '/searchUser';
  @override
  _SearchUserState createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  String value1 = '';
  int currentMax = 5;
  Future<QuerySnapshot<Map<String, dynamic>>> search() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("searchItems", arrayContainsAny: [
          value1,
          value1.toLowerCase(),
          value1.toUpperCase()
        ])
        .limit(currentMax)
        .get();
  }

  bool hasmore = true;

  @override
  Widget build(BuildContext context) {
    final double Mheight = MediaQuery.of(context).size.height;
    final double Mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Search User"),
      ),
      backgroundColor: Color.fromRGBO(16, 15, 1, 1),
      body: Container(
        height: Mheight * 0.8,
        padding: EdgeInsets.symmetric(
            horizontal: Mwidth * 0.03, vertical: Mheight * 0.01),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              onChanged: (String value) {
                setState(() {
                  value1 = value;
                });
              },
              decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 10),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            FutureBuilder(
                future: search(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.length > 0) {
                    if (snapshot.data!.docs.length < currentMax) {
                      hasmore = false;
                    }
                    return Container(
                      height: Mheight * 0.7,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length + 1,
                        itemBuilder: (context, index) => index ==
                                snapshot.data!.docs.length
                            ? hasmore
                                ? TextButton(
                                    onPressed: () {
                                      setState(() {
                                        currentMax = currentMax + 10;
                                      });
                                    },
                                    child: const Text("Find More",
                                        style: TextStyle(color: Colors.white)))
                                : Container(
                                    width: Mwidth * 0.8,
                                    child: const Center(
                                        child: Text("No More results",
                                            style: TextStyle(
                                                color: Colors.white))))
                            : (snapshot.data!.docs[index].data()['Name'] !=
                                    "Add Name")
                                ? InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, searchProfileScreen.route,
                                          arguments: snapshot.data!.docs[index]
                                              .data()['uid']);
                                    },
                                    child: Card(
                                      color:
                                          const Color.fromRGBO(11, 10, 10, 1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                snapshot.data!.docs[index]
                                                    .data()['Image'],
                                                height: Mwidth * 0.14,
                                                width: Mwidth * 0.14,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Mwidth * 0.03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data!.docs[index]
                                                      .data()['Name'],
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  snapshot.data!.docs[index]
                                                      .data()['enrollmentNo'],
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                      ),
                    );
                  }
                  return Container(
                    height: Mheight * 0.2,
                    child: const Center(
                        child: Text(
                      "Cannot Find Any Such User",
                      style: TextStyle(fontSize: 20),
                    )),
                  );
                })
          ],
        ),
      ),
    );
  }
}
