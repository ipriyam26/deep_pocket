// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_final_fields, unused_field, avoid_print, unused_local_variable

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';


class editPost extends StatefulWidget {
  static const route = '/edit-post';

  const editPost({Key? key}) : super(key: key);

  @override
  _editPostState createState() => _editPostState();
}

class _editPostState extends State<editPost> {
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
  List<dynamic> UploadedImage = [];
  var _chosenValue = 'all';

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  // CollectionReference userCollection =
  //     FirebaseFirestore.instance.collection("users");

  int cata = 0;
  int _value = 0;
  double radius = 18;
  List<String> ImageLink = [];
  bool _posting = false;

  void submitted(String id) async {
    String titleCheck = titleController.text;
    String bodyCheck = bodyController.text;
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
    };
    final totalImage = [...UploadedImage, ...ImageLink];
    await FirebaseFirestore.instance.collection("Posts").doc(id).update({
      'Time': DateTime.now(),
      'Title': titleController.text,
      'Body': bodyController.text,
      'ImageLinks': totalImage,
      'Tag': _chosenValue,
    });

    Fluttertoast.showToast(msg: "Post Updated");
    //Sending newPost to previous page via Navigator.
    // context.read<mockData>().addPost(newPost as dataFeed);
    Navigator.of(context).pop(); //<- Attention
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
    final mapArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final PostId = mapArgs["id"];
    setState(() {
      UploadedImage = mapArgs['imageList'];
      bodyController = TextEditingController(text: mapArgs['body']);
      titleController = TextEditingController(text: mapArgs['title']);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff171717),
        title: const Text('Edit Your Question'),
        actions: [
          IconButton(
              onPressed: () {
                submitted(PostId);
              },
              icon: const Icon(Icons.send))
        ],
      ),
      backgroundColor: const  Color(0xff080808),
      body: Stack(
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
                  return const CircularProgressIndicator();
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
                                        items:
                                            Tag.map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  color: Colors.orange),
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
                              scrollPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                          SizedBox(
                            height: Mheight * 0.14,
                            child: TextFormField(
                              maxLength: 500,
                              maxLines: null,
                              minLines: null,
                              initialValue: mapArgs['body'],
                              expands: true,
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
                                                    BorderRadius.circular(20),
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
                                                  icon:  const Icon(
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
                              child:  Icon(
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
                            child:  const Icon(
                              Icons.add_a_photo,
                              // Icons.add_a_photo,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      // ignore: prefer_is_empty
                      if (image.length == 0)
                        SizedBox(
                          height: Mheight * 0.135,
                        ),
                      SizedBox(
                        height: Mheight * 0.03,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: UploadedImage.length,
                            itemBuilder: (context, index) => Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  height: 100,
                                  width: 90,
                                  child: Stack(
                                    // fit: StackFit.passthrough,
                                    // alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            UploadedImage[index],
                                            // height: 80,
                                            // width: 80,
                                            fit: BoxFit.scaleDown,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              UploadedImage.removeAt(index);
                                            });
                                          },
                                          icon:  const Icon(
                                            Icons.cancel,
                                            color: Colors.white,
                                            size: 32,
                                          ))
                                    ],
                                  ),
                                )),
                      )
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
