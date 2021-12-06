// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/user_model.dart';
import 'package:deep_pocket_1/screens/Nearby/nearby_add.dart';
import 'package:deep_pocket_1/screens/Nearby/place.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class nearBy extends StatefulWidget {
  nearBy({Key? key}) : super(key: key);

  @override
  _nearByState createState() => _nearByState();
}

class _nearByState extends State<nearBy> {
  ScrollController _scrollController = ScrollController();

  List<String> Types = [
    'Bank',
    'Food',
    'General Store',
    'Hangouts',
    'Library',
    'Medicine',
    'Library',
    'Salons',
    'Stationers',
  ];

  int _selected = -1;
  int currentMax = 10;
  String _chosenValue = 'Bank';
  Future<QuerySnapshot<Map<String, dynamic>>> getPlaces() async {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          currentMax = currentMax + 5;
        });
      }
    });

    if (_selected == -1) {
      return await FirebaseFirestore.instance
          .collection("Nearby")
          .limit(currentMax)
          .get();
    } else {
      return await FirebaseFirestore.instance
          .collection("Nearby")
          .where("Catagory", isEqualTo: Types[_selected])
          .limit(currentMax)
          .get();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Mwidth = MediaQuery.of(context).size.width;
    final Mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                addPlace(
                  context,
                  Mwidth,
                  Mheight,
                );
                // Navigator.pushNamed(context, NearbAdd.route);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          )
        ],
        title: Text(
          'NearBy'.toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
      ),
      endDrawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "Filters",
              style: const TextStyle(color: Colors.pink),
            ),
          ),
          backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
          body: SafeArea(
              child: Column(
            children: [
              for (int i = -1; i < Types.length; i++)
                ListTile(
                  leading: Radio(
                      value: i,
                      groupValue: _selected,
                      activeColor: Colors.pink,
                      onChanged: (int? value) {
                        setState(() {
                          _selected = value!;
                          Navigator.pop(context);
                        });
                      }),
                  title: i == -1
                      ? const Text(
                          "All",
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          Types[i],
                          style: const TextStyle(color: Colors.white),
                        ),
                )
            ],
          )),
        ),
      ),
      body: FutureBuilder(
          // stream: null,
          future: getPlaces(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              );
            }
            var data = snapshot.data!.docs;
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: data.length,
                  // shrinkWrap: true,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    bool archived = data[index].data()['Archived'] ?? false;
                    if (!archived) {
                      return nearbyCard(data: data[index]);
                    }
                    return Container();
                  }),
            );
          }),
    );
  }

  Future<dynamic> addPlace(
      BuildContext context, double Mwidth, double Mheight) {
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          Future<UserModel> getUserData() async {
            var doc = await FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get();
            return UserModel.fromMap(doc.data());
          }

          return StatefulBuilder(builder: (context, setState) {
            final _formKey = GlobalKey<FormState>();
            final nameController = TextEditingController();
            final addressController = TextEditingController();
            final desController = TextEditingController();
            final linkController = TextEditingController();
            dispose() {
              nameController.dispose();
              addressController.dispose();
              desController.dispose();
              linkController.dispose();
            }

            return Dialog(
                child: Container(
              color: Colors.black.withOpacity(0.8),
              width: Mwidth * 0.95,
              height: Mheight * 0.65,
              padding: EdgeInsets.symmetric(
                  horizontal: Mwidth * 0.04, vertical: Mheight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add a Place",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 22),
                  ),
                  DropdownButton<String>(
                    focusColor: Colors.black,
                    value: _chosenValue,
                    dropdownColor: Colors.black,
                    elevation: 0,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    iconEnabledColor: Colors.pink,
                    items: Types.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.pink),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _chosenValue = value.toString();
                      });
                    },
                  ),
                  SizedBox(
                    height: Mheight * 0.01,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          scrollPadding: EdgeInsets.zero,
                          autocorrect: false,
                          style: const TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.top,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter a Name :)';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Name",
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedErrorBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            errorBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        SizedBox(
                          height: Mheight * 0.01,
                        ),
                        TextFormField(
                          controller: addressController,
                          scrollPadding: EdgeInsets.zero,
                          autocorrect: false,
                          style: const TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.top,
                          validator: (value) {
                            if (value == null || value.length < 10) {
                              return 'Please Enter A Proper Address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Address",
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedErrorBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            errorBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        SizedBox(
                          height: Mheight * 0.01,
                        ),
                        TextFormField(
                          controller: desController,
                          scrollPadding: EdgeInsets.zero,
                          autocorrect: false,
                          maxLines: 2,
                          style: const TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.top,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter a Small Description :)';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Description",
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedErrorBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            errorBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        SizedBox(
                          height: Mheight * 0.01,
                        ),
                        TextFormField(
                          controller: linkController,
                          scrollPadding: EdgeInsets.zero,
                          autocorrect: false,
                          style: const TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.top,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter a Maps Link!!';
                            } else if (!value.contains(
                                "https://www.google.com/maps/place")) {
                              return 'Please Enter a Google Maps link';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Link",
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedErrorBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            errorBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () async {
                                  String nearbyID = "";
                                  if (_formKey.currentState!.validate()) {
                                    await FirebaseFirestore.instance
                                        .collection("Nearby")
                                        .add({
                                      'Name': nameController.text,
                                      'Address': addressController.text,
                                      'Url': linkController.text,
                                      'Catagory': _chosenValue,
                                      'Description': desController.text,
                                      'Rating': 0,
                                      'Archived': true
                                    }).then((value) {
                                      nearbyID = value.id;
                                    });

                                    var newPostNearby = {
                                      'AuthorUID': FirebaseAuth
                                          .instance.currentUser!.uid,
                                      'AuthorProfilePic':
                                          "https://t3.ftcdn.net/jpg/03/32/31/96/240_F_332319626_8JB5rN3WmHEunZ1PkJBMjva3sH5Rxe0v.jpg",
                                      'AuthorName': _chosenValue,
                                      'Time': DateTime.now(),
                                      'Title': nameController.text,
                                      'Body': "Address :  " +
                                          addressController.text +
                                          "\n" +
                                          "Describtion:  " +
                                          desController.text,
                                      'ImageLinks': [],
                                      'Likes': 0,
                                      'DisLike': 0,
                                      'Comments': 0,
                                      'Tag': "Nearby",
                                      'LikedBy': [],
                                      'DislikedBy': [],
                                      "Anonymous": false,
                                      "SpecialID": linkController.text,
                                      "NearbyID": nearbyID
                                    };

                                    await FirebaseFirestore.instance
                                        .collection("Posts")
                                        .add(newPostNearby);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    dispose();
                                    Navigator.pop(ctx);
                                  }
                                },
                                child: const Text(
                                  "ADD",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                      fontSize: 20),
                                )))
                      ],
                    ),
                  )
                ],
              ),
            ));
          });
        });
  }
}

class nearbyCard extends StatelessWidget {
  nearbyCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  Map<String, IconData> TypesImage =
      // 'All',
      {
    'Bank': Icons.account_balance,
    'Food': Icons.food_bank,
    'General Store': Icons.add_business,
    'Hangouts': Icons.catching_pokemon,
    'Library': Icons.library_books,
    'Medicine': Icons.medication,
    'Salons': Icons.content_cut,
    'Stationers': Icons.edit,
  };
  final QueryDocumentSnapshot<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.pink,
      onTap: () {
        Navigator.pushNamed(
          context,
          place.route,
          arguments: data,
        );
      },
      child: Card(
        color: const Color.fromRGBO(40, 41, 40, 1),
        child: ListTile(
          trailing: IconButton(
            splashColor: Colors.pink,
            icon: const Icon(
              Icons.directions_outlined,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () async {
              final url = data.data()['Url'];
              if (await canLaunch(url!)) {
                await launch(
                  url,
                  forceSafariVC: true,
                  forceWebView: true,
                  enableJavaScript: true,
                );
              }
            },
          ),
          leading: Icon(
            TypesImage[data.data()['Catagory']],
            color: Colors.pink,
            size: 42,
          ),
          subtitle: Text(
            data.data()['Address'],
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          title: Text(
            data.data()['Name'],
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
