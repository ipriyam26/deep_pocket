// ignore_for_file: non_constant_identifier_names, avoid_print, camel_case_types, use_key_in_widget_constructors

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:deep_pocket_1/tabs_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class userInput extends StatefulWidget {
  static const route = '/user-input';

  @override
  _userInputState createState() => _userInputState();
}

class _userInputState extends State<userInput> {
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
  List<File> image = [];
  var _chosenValue = 'all';

  bool makeAnonymous = false;

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final pointsController = TextEditingController();
  // CollectionReference userCollection =
  //     FirebaseFirestore.instance.collection("users");

  int cata = 0;

  double radius = 18;
  List<String> ImageLink = [];
  bool _posting = false;

  void submitted() async {
    String titleCheck = titleController.text;
    String bodyCheck = bodyController.text;
    // ignore: unused_local_variable
    int tag = Tag.indexOf(_chosenValue);
    if (titleCheck.isEmpty || bodyCheck.length < 10) {
      return;
    }
    print("Total Images to be uploaded ${image.length}");
    setState(() {
      _posting = true;
    });
    for (int i = 0; i < image.length; i++) {
      var link = await API_Manager().postImage(image[i].path);
      ImageLink.add(link);
    }

    String? userName;
    String? userImage;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      userName = value['Name'];
      userImage = value['Image'];
    });

    var newPost = {
      'AuthorUID': user!.uid,
// 'PostID':,

      'AuthorProfilePic': userImage,
      'AuthorName': userName,
      'Time': DateTime.now(),
      'Title': titleController.text,
      'Body': bodyController.text,
      'ImageLinks': ImageLink,
      'Likes': 0,
      'Comments': 0,
      'Tag': _chosenValue,
      'LikedBy': [],
      "Anonymous": makeAnonymous,
    };
    if (_chosenValue == 'Query') {
      newPost = {
        'AuthorUID': user!.uid,
        'Points ': (pointsController.text == "")
            ? 5
            : int.parse(pointsController.text),
        'AuthorProfilePic': userImage,
        'AuthorName': userName,
        'Time': DateTime.now(),
        'Title': titleController.text,
        'Body': bodyController.text,
        'ImageLinks': ImageLink,
        'Likes': 0,
        'Comments': 0,
        'Tag': _chosenValue,
        'LikedBy': [],
        "Anonymous": makeAnonymous,
        "Correct": "No One"
      };
    }

    await FirebaseFirestore.instance
        .collection("Posts")
        .add(newPost)
        .then((value) => print(value));

    //Sending newPost to previous page via Navigator.
    // context.read<mockData>().addPost(newPost as dataFeed);
    Navigator.pushNamed(context, TabsScreen.route); //<- Attention
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  void uploadImage() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                // IconButton(onPressed: _pickImage, icon: icon)
                TextButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.image),
                    label: const Text("Open Gallery")),
                TextButton.icon(
                    onPressed: _pickImageCamera,
                    icon: const Icon(Icons.camera),
                    label: const Text("Take A Picture")),
              ],
            ),
          );
        });
  }

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final MWidth = MediaQuery.of(context).size.width;
    final Mheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff171717),
        title: const Text('Ask a Question'),
        actions: [
          IconButton(onPressed: submitted, icon: const Icon(Icons.send))
        ],
      ),
      backgroundColor: const Color(0xff080808),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Mheight * 0.9,
          child: Stack(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(user!.uid)
                      .get()
                      .asStream(),
                  builder: (context,
                      AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.pink,
                      ));
                    }
                    var userdata = snapshot.data!.data();

                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Mheight * 0.10,
                            // color: Colors.amber,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                userdata!['Image'] == null
                                    ? ClipOval(
                                        child: Container(
                                          color: Colors.grey,
                                          width: MWidth * 0.2,
                                          height: MWidth * 0.2,
                                        ),
                                      )
                                    : ClipOval(
                                        child: Image.network(
                                          userdata['Image'],
                                          width: MWidth * 0.2,
                                          height: MWidth * 0.2,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                SizedBox(
                                  width: MWidth * 0.05,
                                ),
                                SizedBox(
                                  // color: Colors.amber,
                                  width: MWidth * 0.65,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        userdata['Name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        maxFontSize: 28,
                                        minFontSize: 24,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Select a Tag:",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: MWidth * 0.05,
                                          ),
                                          DropdownButton<String>(
                                            focusColor: Colors.black,
                                            value: _chosenValue,
                                            dropdownColor: Colors.black,
                                            elevation: 0,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                            iconEnabledColor: Colors.pink,
                                            items: Tag.map<
                                                    DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: const TextStyle(
                                                      color: Colors.pink),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              setState(() {
                                                _chosenValue = value.toString();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Mheight * 0.03,
                          ),
                          if (_chosenValue == 'Query')
                            SizedBox(
                              height: Mheight * 0.08,
                              child: TextFormField(
                                controller: pointsController,
                                maxLength: 2,
                                autocorrect: false,
                                scrollPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                // onChanged: (value){
                                //   titleController = value;

                                validator: (value) {
                                  if (value!.length > 2) {
                                    return ("nothing more than 99");
                                  }
                                },
                                // },

                                decoration: const InputDecoration(
                                    errorStyle: TextStyle(color: Colors.red),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    hintText: "Points",
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    )),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Mheight * 0.08,
                                child: TextFormField(
                                  maxLines: null,
                                  minLines: null,
                                  expands: true,
                                  controller: titleController,
                                  maxLength: 80,
                                  autocorrect: false,
                                  scrollPadding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  // onChanged: (value){
                                  //   titleController = value;

                                  validator: (value) {
                                    if (value!.length <= 20) {
                                      return ("Title should be at least 20 Characters");
                                    }
                                  },
                                  // },

                                  decoration: const InputDecoration(
                                      errorStyle: TextStyle(color: Colors.red),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      hintText: "Title",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Mheight * 0.01,
                              ),
                              SizedBox(
                                height: Mheight * 0.17,
                                child: TextFormField(
                                  maxLength: 500,
                                  maxLines: null,
                                  minLines: null,
                                  expands: true,
                                  controller: bodyController,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      hintText:
                                          "Describe what you are talking about",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Make Anonymous:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Switch(
                                  // inactiveThumbColor: Colors.blue,
                                  activeTrackColor: Colors.pink,
                                  inactiveTrackColor: Colors.grey,
                                  activeColor: Colors.pink,
                                  value: makeAnonymous,
                                  onChanged: (value) {
                                    setState(() {
                                      makeAnonymous = value;
                                      value = !value;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: Mheight * 0.02,
                          ),
                          image.isNotEmpty
                              ? SizedBox(
                                  height: Mheight * 0.28,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      aspectRatio: 4.5 / 3,
                                      viewportFraction: 0.95,
                                      enlargeCenterPage: false,
                                      enableInfiniteScroll: false,
                                      autoPlay: false,
                                    ),
                                    items: image
                                        .map(
                                          (item) => Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.file(
                                                      item,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          image.remove(item);
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                        size: 40,
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                              : InkWell(
                                  onTap: uploadImage,
                                  splashColor: Colors.white,
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: Mheight * 0.18,
                                    color: Colors.white,
                                  ),
                                ),
                          if (image.isNotEmpty)
                            Container(
                              width: double.maxFinite,
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: uploadImage,
                                splashColor: Colors.white,
                                child: const Icon(
                                  Icons.add_a_photo,
                                  // Icons.add_a_photo,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
              if (_posting)
                Container(
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                    child: SizedBox(
                      height: Mheight * 0.1,
                      width: Mheight * 0.1,
                      child: const CircularProgressIndicator(
                        color: Colors.orange,
                        strokeWidth: 7,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageCamera() async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (newimage == null) {
        print("object");
        return;
      }
      final tempImage = File(newimage.path);
      setState(() {
        image.add(tempImage);
      });

      Navigator.pop(context);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _pickImage() async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (newimage == null) {
        return;
      }
      final tempImage = File(newimage.path);

      setState(() {
        image.add(tempImage);
      });

      Navigator.pop(context);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
