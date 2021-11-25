import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class createEvent extends StatefulWidget {
  static const route = '/createEvent';

  @override
  State<createEvent> createState() => _createEventState();
}

class _createEventState extends State<createEvent> {
  File? image;
  User? user = FirebaseAuth.instance.currentUser;

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  final titleController = TextEditingController();
  final OrgController = TextEditingController();
  final linkController = TextEditingController();

  final bodyController = TextEditingController();

  String ImageLink = "";
  List<String> hostImageLink = [];
  bool _posting = false;

  void submitted() async {
    String titleCheck = titleController.text;
    String bodyCheck = bodyController.text;

    if (titleCheck.isEmpty || bodyCheck.length < 5) {
      return;
    }

    setState(() {
      _posting = true;
    });
    ImageLink = await API_Manager().postImage(image!.path);
    for (int i = 0; i < hostImage.length; i++) {
      var link = await API_Manager().postImage(hostImage[i].path);
      hostImageLink.add(link);
    }
    var newEvent = {
      'AuthorUID': user!.uid,
      'Time': DateTime.now(),
      'Org': OrgController.text,
      'Title': titleController.text,
      'StartingDate': selectedStartDate,
      'EndingDate': selectedEndDate,
      'Description': bodyController.text,
      'Link': linkController.text,
      'HostImage': hostImageLink,
      'HostName': hostName,
      'HostRole': hostRole,
      'Image': ImageLink,
    };
    await FirebaseFirestore.instance
        .collection("Events")
        .add(newEvent)
        .then((value) => print(value));

    //Sending newPost to previous page via Navigator.
    // context.read<mockData>().addPost(newPost as dataFeed);
    Navigator.of(context).pop(); //<- Attention
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    linkController.dispose();
    OrgController.dispose();

    bodyController.dispose();
    super.dispose();
  }

  bool addEndDate = false;

  Future<void> _pickImage() async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (newimage == null) {
        return;
      }
      final tempImage = File(newimage.path);

      setState(() {
        image = tempImage;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  List<File> hostImage = [];
  List<String> hostRole = [];
  List<String> hostName = [];

  int hosts = 2;

  Future<void> _pickImagehHost(BuildContext context) async {
    try {
      final newimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (newimage == null) {
        return;
      }
      String HostsName = "";
      String HostsDesgination = "";
      final dialogueImage = File(newimage.path);
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            final NameController = TextEditingController();
            final DesignationController = TextEditingController();
            return Dialog(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: MediaQuery.of(context).size.height * 0.182,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: Image.file(
                                dialogueImage,
                                height: MediaQuery.of(context).size.width * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: TextField(
                                    controller: NameController,
                                    decoration: const InputDecoration(
                                        hintText: "Host Name"),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: TextField(
                                    controller: DesignationController,
                                    decoration: const InputDecoration(
                                        hintText: "Host Designation"),
                                  ),
                                ),
                              ],
                            )
                          ]),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              hostImage.add(dialogueImage);
                              hostName.add(NameController.text.toString());
                              hostRole
                                  .add(DesignationController.text.toString());
                            });
                            Navigator.pop(ctx);
                          },
                          child: Text("ADD"))
                    ],
                  )),
            );
          });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final MWidth = MediaQuery.of(context).size.width;
    final Mheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff171717),
        title: const Text('Post A Event'),
        actions: [
          IconButton(onPressed: submitted, icon: const Icon(Icons.send))
        ],
      ),
      backgroundColor: const Color(0xff080808),
      body: SingleChildScrollView(
        child: Container(
          height: Mheight * 1.4,
          child: Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //title
                        titleField(
                            Mheight: Mheight,
                            titleController: titleController), //Title
                        SizedBox(
                          height: Mheight * 0.02,
                        ),
                        //organisation
                        OrgField(
                            Mheight: Mheight, OrgController: OrgController),
                        SizedBox(
                          height: Mheight * 0.02,
                        ),
                        //Starting Date
                        Container(
                          height: Mheight * 0.09,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Starting Date:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: Mheight * 0.05,
                                // width: MWidth*0.4,

                                child: CupertinoDatePicker(
                                    minimumDate: DateTime.now(),
                                    backgroundColor: Colors.grey,
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (date) {
                                      setState(() {
                                        selectedStartDate = date;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                            // trackColor: Colors.pink,
                            activeColor: Colors.pink,
                            trackColor: MaterialStateProperty.all(Colors.grey),
                            value: addEndDate,
                            onChanged: (value) {
                              setState(() {
                                addEndDate = value;
                              });
                            }),
                        if (addEndDate)
                          //End date
                          SizedBox(
                            height: Mheight * 0.09,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Ending Date:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: Mheight * 0.05,
                                  // width: MWidth*0.4,

                                  child: CupertinoDatePicker(
                                      minimumDate: DateTime.now(),
                                      backgroundColor: Colors.grey,
                                      initialDateTime: DateTime.now(),
                                      onDateTimeChanged: (date) {
                                        setState(() {
                                          selectedEndDate = date;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),

                        EventField(
                            Mheight: Mheight, bodyController: bodyController),
                        SizedBox(
                          height: Mheight * 0.02,
                        ),
                        linkField(
                            Mheight: Mheight, linkController: linkController),

                        if (image == null)
                          SizedBox(
                            height: Mheight * 0.03,
                          ),
                        image == null
                            ? InkWell(
                                onTap: _pickImage,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: MWidth * 0.3,
                                ))
                            : Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    height: MWidth * 0.5,
                                    padding: const EdgeInsets.all(15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          image = null;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                        size: MWidth * 0.1,
                                      )),
                                ],
                              ),
                        Container(
                          width: MWidth,
                          child: Column(
                            children: [
                              Container(
                                width: MWidth,
                                child: const Text(
                                  "Host:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: hostImage.length + 1,
                                  itemBuilder: (context, index) => index ==
                                          hostImage.length
                                      ? InkWell(
                                          splashColor: Colors.white,
                                          onTap: () {
                                            _pickImagehHost(context);
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        )
                                      : Card(
                                          color: const Color(0xff171717),
                                          child: ListTile(
                                            leading: ClipOval(
                                              child: Image.file(
                                                  hostImage[index],
                                                  height: MWidth * 0.2,
                                                  width: MWidth * 0.19,
                                                  fit: BoxFit.cover),
                                            ),
                                            title: Text(
                                              hostName[index],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              hostRole[index],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              if (_posting)
                Container(
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                    child: Container(
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
}

class linkField extends StatelessWidget {
  const linkField({
    Key? key,
    required this.Mheight,
    required this.linkController,
  }) : super(key: key);

  final double Mheight;
  final TextEditingController linkController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Mheight * 0.05,
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.url,
        controller: linkController,
        autocorrect: false,
        scrollPadding: EdgeInsets.symmetric(horizontal: 5),

        validator: (value) {
          if (!value!.contains("https://")) {
            return ("please add a link only");
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
            hintText: "Link",
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
    );
  }
}

class EventField extends StatelessWidget {
  const EventField({
    Key? key,
    required this.Mheight,
    required this.bodyController,
  }) : super(key: key);

  final double Mheight;
  final TextEditingController bodyController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Mheight * 0.15,
      child: TextFormField(
        // maxLength: 1500,
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
            hintText: "Event Description",
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 13,
        ),
      ),
    );
  }
}

class OrgField extends StatelessWidget {
  const OrgField({
    Key? key,
    required this.Mheight,
    required this.OrgController,
  }) : super(key: key);

  final double Mheight;
  final TextEditingController OrgController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Mheight * 0.05,
      child: TextFormField(
        maxLines: null,
        minLines: null,
        expands: true,
        controller: OrgController,
        autocorrect: false,
        scrollPadding: EdgeInsets.symmetric(horizontal: 5),
        validator: (value) {
          if (value!.length <= 5) {
            return ("Organisation should be at least 5 Characters");
          }
        },
        decoration: const InputDecoration(
            errorStyle: TextStyle(color: Colors.red),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: "Organisation",
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
    );
  }
}

class titleField extends StatelessWidget {
  const titleField({
    Key? key,
    required this.Mheight,
    required this.titleController,
  }) : super(key: key);

  final double Mheight;
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Mheight * 0.05,
      child: TextFormField(
        maxLines: null,
        minLines: null,
        expands: true,
        controller: titleController,

        autocorrect: false,
        scrollPadding: EdgeInsets.symmetric(horizontal: 5),
        // onChanged: (value){
        //   titleController = value;

        validator: (value) {
          if (value!.length <= 5) {
            return ("Title should be at least 5 Characters");
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
    );
  }
}
