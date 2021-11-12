import 'dart:io';

import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:deep_pocket_1/models/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';

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
      var link = await API_Manager().postImage(image[0].path);
      ImageLink.add(link);
    }
    // final newPost = dataFeed(
    //   id: DateTime.now().toString(),
    //   imgsrc: "http://simpleicon.com/wp-content/uploads/user1.png",
    //   name: "Priyam ",
    //   title: titleCheck,
    //   text: bodyCheck,
    //   tag: tag,
    //   date: DateTime.now().toString(),
    // );

    //Sending newPost to previous page via Navigator.
    // context.read<mockData>().addPost(newPost as dataFeed);
    Navigator.of(context).pop(); //<- Attention
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Ask a Question'),
        ),
        backgroundColor: const Color(0xff080808),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (image.isNotEmpty)
                    for (int i = 0; i < image.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image[i],
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.height * 0.08,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  IconButton(
                      // onPressed: _pickImage,
                      onPressed: uploadImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 36,
                        color: Colors.white,
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextField(
                controller: titleController,
                maxLength: 90,
                buildCounter: (
                  BuildContext context, {
                  required int currentLength,
                  required int? maxLength,
                  required bool isFocused,
                }) {
                  return Text(
                    '$currentLength/$maxLength',
                    style: const TextStyle(color: Colors.white),
                    semanticsLabel: 'character count',
                  );
                },
                style: const TextStyle(color: Colors.white),
                maxLines: 1,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelStyle: TextStyle(height: 0.1),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  filled: true,
                  fillColor: Color(0xff0f0f0f),
                  focusColor: Colors.grey,
                  focusedBorder: InputBorder.none,
                  label: Text('Title',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: TextField(
                  controller: bodyController,
                  maxLength: 500,
                  buildCounter: (
                    BuildContext context, {
                    required int currentLength,
                    required int? maxLength,
                    required bool isFocused,
                  }) {
                    return Text(
                      '$currentLength/$maxLength',
                      style: const TextStyle(color: Colors.white),
                      semanticsLabel: 'character count',
                    );
                  },
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(color: Colors.white),
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle: TextStyle(height: 0.1),
                    // enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xff0f0f0f),
                    focusColor: Colors.grey,
                    label: Text('Type Something',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
                        )),
                  ),
                ),
              ),
              const Text("Pick a Tag",
                  style: TextStyle(color: Colors.orange, fontSize: 18)),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: DropdownButton<String>(
                  focusColor: Colors.black,
                  value: _chosenValue,
                  dropdownColor: Colors.black,
                  elevation: 10,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  iconEnabledColor: Colors.orange,
                  items: Tag.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        // color: Colors.black,
                        // width: double.maxFinite,
                        // padding: EdgeInsets.all(5),
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.orange),
                        ),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "select a tag",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _chosenValue = value.toString();
                    });
                  },
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Post"))
            ],
          ),
        ));
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
      var link = await API_Manager().postImage(newimage.path);
      setState(() {
        ImageLink.add(link);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
