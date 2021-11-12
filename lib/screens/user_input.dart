import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:deep_pocket_1/models/mock_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:provider/src/provider.dart';
import 'package:readmore/readmore.dart';

import '../models/data_feed.dart';

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

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  // CollectionReference userCollection =
  //     FirebaseFirestore.instance.collection("users");

  int cata = 0;
  int _value = 0;
  double radius = 18;
  List<String> ImageLink = [];

  void submitted() async {
    String titleCheck = titleController.text;
    String bodyCheck = bodyController.text;
    int tag = Tag.indexOf(_chosenValue);
    if (titleCheck.isEmpty || bodyCheck.length < 10) {
      return;
    }
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
      'Date': DateFormat.yMMMMd('en_US').format(DateTime.now()),
      'Time': DateFormat.jm().format(DateTime.now()),
      'Title': titleController.text,
      'Body': bodyController.text,
      'ImageLinks': ImageLink,
      'Likes': 0,
      'Comments': 0,
      'Tag': _chosenValue,
    };
    await FirebaseFirestore.instance
        .collection("Posts")
        .add(newPost)
        .then((value) => print(value));

    //Sending newPost to previous page via Navigator.
    // context.read<mockData>().addPost(newPost as dataFeed);
    Navigator.of(context).pop(); //<- Attention
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  void uploadImage() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                // IconButton(onPressed: _pickImage, icon: icon)
                TextButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(Icons.image),
                    label: Text("Open Gallery")),
                TextButton.icon(
                    onPressed: _pickImageCamera,
                    icon: Icon(Icons.camera),
                    label: Text("Take A Picture")),
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
          backgroundColor: Color(0xff171717),
          title: const Text('Ask a Question'),
        ),
        backgroundColor: const Color(0xff080808),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(user!.uid)
                .get()
                .asStream(),
            builder: (context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                    snapshot) {
              var userdata = snapshot.data!.data();

              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
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
                          Container(
                            // color: Colors.amber,
                            width: MWidth * 0.65,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Select a Tag:",
                                      style: TextStyle(color: Colors.white),
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
                                      iconEnabledColor: Colors.orange,
                                      items: Tag.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  color: Colors.orange),
                                            ),
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
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Mheight * 0.01,
                    ),
                    Container(
                      // height: widget.MHeight * 0.1,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: Mheight * 0.08,
                            child: TextFormField(
                              maxLines: null,
                              minLines: null,
                              expands: true,
                              controller: titleController,
                              maxLength: 80,
                              autocorrect: false,
                              scrollPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              // onChanged: (value){
                              //   titleController = value;
                              // },
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                          Container(
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
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                    ),
                    image.isNotEmpty
                        ? Container(
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
                                      child: Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.file(
                                            item,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
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
                              size: Mheight * 0.15,
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
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    Container(
                      width: double.maxFinite,
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.orange),
                          ),
                          onPressed: () {
                            submitted();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.black,
                            size: 30,
                          ),
                          label: const Text(
                            "Post",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                  ],
                ),
              );
            }));
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
      // final PermaImage = await saveImagePermanently(image.path);
      print(newimage.path);
      setState(() {
        image.add(tempImage);
        // image = tempImage;
      });
      // var link = await API_Manager().postImage(newimage.path);
      // setState(() {
      //   ImageLink.add(link);
      // });
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
        print("object");
        return;
      }
      final tempImage = File(newimage.path);
      // final PermaImage = await saveImagePermanently(image.path);
      print(newimage.path);
      setState(() {
        image.add(tempImage);
        // image = tempImage;
      });
      // var link = await API_Manager().postImage(newimage.path);
      // setState(() {
      //   ImageLink.add(link);
      // });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
