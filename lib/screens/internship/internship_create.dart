import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/api_integration_imgur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class internCreate extends StatefulWidget {
  const internCreate({Key? key}) : super(key: key);
  static const route = '/internCreate';

  @override
  State<internCreate> createState() => _internCreateState();
}

class _internCreateState extends State<internCreate> {
  File? image;
  User? user = FirebaseAuth.instance.currentUser;

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  final OrgController = TextEditingController();
  final linkController = TextEditingController();
  final titleController = TextEditingController();

  final bodyController = TextEditingController();
  final companyController = TextEditingController();
  final softwareController = TextEditingController();
  final locationController = TextEditingController();
  final StipendController = TextEditingController();
  final SlotController = TextEditingController();
  final SkillsController = TextEditingController();
  final DurationController = TextEditingController();

  String ImageLink = "";
  List<String> hostImageLink = [];
  bool _posting = false;
  bool _workFromHome = false;
  bool _partTimeAllowed = false;
  bool _anyStipend = false;

  List<File> hostImage = [];
  List<String> hostRole = [];
  List<String> hostName = [];
  void submitted() async {
    String bodyCheck = bodyController.text;
    String OrgCheck = OrgController.text;
    String linkCheck = linkController.text;
    String titlCheck = titleController.text;
    String compCheck = companyController.text;
    String softCheck = softwareController.text;
    String locaCheck = locationController.text;
    String StipCheck = StipendController.text;
    String SlotCheck = SlotController.text;
    String SkilCheck = SkillsController.text;
    String DuraCheck = DurationController.text;

    if (bodyCheck.isEmpty ||
        OrgCheck.isEmpty ||
        linkCheck.isEmpty ||
        titlCheck.isEmpty ||
        compCheck.isEmpty ||
        softCheck.isEmpty ||
        locaCheck.isEmpty ||
        SlotCheck.isEmpty ||
        SkilCheck.isEmpty ||
        DuraCheck.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
    }

    setState(() {
      _posting = true;
    });
    ImageLink = await API_Manager().postImage(image!.path);

    var newEvent = {
      'AuthorUID': user!.uid,
      'Time': DateTime.now(),
      'Org': OrgController.text,
      'Title': titleController.text,
      'StartingDate': selectedStartDate,
      'EndingDate': selectedEndDate,
      'JobDescription': bodyController.text,
      'Link': linkController.text,
      'Image': ImageLink,
      'Duration': DuraCheck,
      'Skills': SkilCheck,
      'Slots': SlotCheck,
      'Location': locaCheck,
      'Stipend': StipCheck == '' ? "0" : StipCheck,
      'PartTimeAllowed': _partTimeAllowed,
      'WorkFromHome': _workFromHome,
      'Softwares': softCheck,
      'AboutComapny': compCheck,
      'Applied': 0,
    };
    await FirebaseFirestore.instance
        .collection("Internships")
        .add(newEvent)
        .then((value) => print(value));

    //Sending newPost to previous page via Navigator.
    // context.read<mockData>().addPost(newPost as dataFeed);
    Navigator.of(context).pop(); //<- Attention
  }

  @override
  void dispose() {
    bodyController.dispose();
    OrgController.dispose();
    linkController.dispose();
    titleController.dispose();
    companyController.dispose();
    softwareController.dispose();
    locationController.dispose();
    StipendController.dispose();
    SlotController.dispose();
    SkillsController.dispose();
    DurationController.dispose();

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

  int hosts = 2;

  @override
  Widget build(BuildContext context) {
    final MWidth = MediaQuery.of(context).size.width;
    final Mheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff171717),
        title: const Text('Post A Internship'),
        actions: [
          IconButton(onPressed: submitted, icon: const Icon(Icons.send))
        ],
      ),
      backgroundColor: const Color(0xff080808),
      body: SingleChildScrollView(
        child: Container(
          height: Mheight * 2,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: Mheight * 0.01,
                        ),
                        Row(
                          children: [
                            const Text("Slots: ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              width: MWidth * 0.2,
                              height: Mheight * 0.04,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.white),
                                autocorrect: false,
                                controller: SlotController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.1),
                                    border: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Mheight * 0.01,
                        ),
                        Row(
                          children: [
                            const Text("Duration: ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            Container(
                              width: MWidth * 0.2,
                              height: Mheight * 0.04,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.white),
                                autocorrect: false,
                                controller: DurationController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.1),
                                    border: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                            ),
                            const Text("  Days",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: Mheight * 0.01,
                        ),

                        Row(
                          children: [
                            const Text("Work From Home: ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _workFromHome = !_workFromHome;
                                  });
                                },
                                child: Text(_workFromHome.toString()))
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Part Time: ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _partTimeAllowed = !_partTimeAllowed;
                                  });
                                },
                                child: Text(_partTimeAllowed.toString()))
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Stipend: ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _anyStipend = !_anyStipend;
                                  });
                                },
                                child: Text(_anyStipend.toString())),
                            if (_anyStipend)
                              Container(
                                width: MWidth * 0.3,
                                height: Mheight * 0.04,
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  autocorrect: false,
                                  controller: StipendController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.1),
                                      border: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                              ),
                            if (_anyStipend)
                              const Text(" per Month",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                          ],
                        ),

                        (selectedStartDate == null && selectedEndDate == null)
                            ? datePick(context, Mheight, MWidth)
                            : dateShow(Mheight),
                        bodyController.text.isEmpty
                            ? buttonAdd(context, Mheight, MWidth,
                                "Job Description:", bodyController, null)
                            : EventField(
                                Mheight: Mheight,
                                heading: "Job Description",
                                bodyController: bodyController),
                        SizedBox(
                          height: Mheight * 0.01,
                        ),
                        SkillsController.text.isEmpty
                            ? buttonAdd(
                                context,
                                Mheight,
                                MWidth,
                                "Skills Needed: ",
                                SkillsController,
                                "Please Seperate with commas and not but line")
                            : EventField(
                                Mheight: Mheight,
                                heading: "Skills Needed",
                                bodyController: SkillsController),
                        SizedBox(
                          height: Mheight * 0.01,
                        ),
                        companyController.text.isEmpty
                            ? buttonAdd(
                                context,
                                Mheight,
                                MWidth,
                                "Company Description: ",
                                companyController,
                                null)
                            : EventField(
                                Mheight: Mheight,
                                heading: "Company Description",
                                bodyController: companyController),
                        SizedBox(
                          height: Mheight * 0.01,
                        ),
                        softwareController.text.isEmpty
                            ? buttonAdd(
                                context,
                                Mheight,
                                MWidth,
                                "Softwares needed: ",
                                softwareController,
                                "Please Seperate By Commas")
                            : EventField(
                                Mheight: Mheight,
                                heading: "Softwares needed",
                                bodyController: softwareController),
                        locationController.text.isEmpty
                            ? buttonAdd(context, Mheight, MWidth, "Location: ",
                                locationController, "Please Seperate By Commas")
                            : EventField(
                                Mheight: Mheight,
                                heading: "loaction",
                                bodyController: locationController),
                        SizedBox(
                          height: Mheight * 0.01,
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

  Container dateShow(double Mheight) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Mheight * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Starting Date: ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink)),
              Text("${DateFormat.yMd().format(selectedStartDate!)} ",
                  style: const TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
          Row(
            children: [
              const Text("Ending Date: ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink)),
              Text("${DateFormat.yMd().format(selectedEndDate!)} ",
                  style: const TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
          // Text(s)
        ],
      ),
    );
  }

  Row datePick(BuildContext context, double Mheight, double MWidth) {
    return Row(
      children: [
        const Text(
          "Dates:",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    DateTime? StartingDate;
                    DateTime? EndingDate;
                    return Dialog(
                      child: Container(
                        height: Mheight * 0.25,
                        width: MWidth * 0.9,
                        margin: EdgeInsets.symmetric(vertical: Mheight * 0.013),
                        child: Column(
                          children: [
                            const Text(
                              "Starting Date",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                            SizedBox(
                              height: Mheight * 0.01,
                            ),
                            Container(
                              width: MWidth * 0.7,
                              height: Mheight * 0.04,
                              child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  minimumDate: DateTime.now(),
                                  backgroundColor: Colors.grey,
                                  initialDateTime: DateTime.now(),
                                  onDateTimeChanged: (date) {
                                    setState(() {
                                      StartingDate = date;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: Mheight * 0.022,
                            ),
                            const Text(
                              "Ending Date",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                            SizedBox(
                              height: Mheight * 0.01,
                            ),
                            Container(
                              width: MWidth * 0.7,
                              height: Mheight * 0.04,
                              child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  minimumDate: DateTime.now(),
                                  backgroundColor: Colors.grey,
                                  initialDateTime: DateTime.now(),
                                  onDateTimeChanged: (date) {
                                    setState(() {
                                      EndingDate = date;
                                    });
                                  }),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedStartDate = StartingDate;
                                          selectedEndDate = EndingDate;
                                        });
                                        Navigator.pop(ctx);
                                      },
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  SizedBox(
                                    width: MWidth * 0.03,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: const Text("Pick Dates")),
      ],
    );
  }

  Row buttonAdd(BuildContext context, double Mheight, double MWidth, heading,
      TextEditingController controller, String? helpterText) {
    return Row(
      children: [
        Text(
          heading,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    final desController = TextEditingController();
                    return Dialog(
                      backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
                      child: Container(
                          height: Mheight * 0.68,
                          width: MWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: MWidth * 0.03,
                              vertical: Mheight * 0.013),
                          child: Column(
                            children: [
                              Text(
                                heading,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: Mheight * 0.57,
                                margin: EdgeInsets.symmetric(
                                    vertical: Mheight * 0.01),
                                child: helpterText != null
                                    ? TextField(
                                        controller: desController,
                                        cursorColor: Colors.white,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        textAlignVertical:
                                            TextAlignVertical.top,
                                        maxLines: null,
                                        minLines: null,
                                        expands: true,
                                        decoration: InputDecoration(
                                            helperText: helpterText,
                                            helperStyle:
                                                TextStyle(color: Colors.white),
                                            enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            border: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)))))
                                    : TextField(
                                        controller: desController,
                                        cursorColor: Colors.white,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        textAlignVertical:
                                            TextAlignVertical.top,
                                        maxLines: null,
                                        minLines: null,
                                        expands: true,
                                        decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(10))),
                                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(10))))),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          controller.text = desController.text;
                                        });
                                        Navigator.pop(ctx);
                                      },
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              )
                            ],
                          )),
                    );
                  });
            },
            child: Text("Add Description"))
      ],
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
      height: Mheight * 0.03,
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
            contentPadding: EdgeInsets.zero,
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
              fontSize: 17,
              fontWeight: FontWeight.w600,
            )),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 16,
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
      height: Mheight * 0.03,
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
            // label: Text("Title"),
            errorStyle: TextStyle(color: Colors.red),
            contentPadding: EdgeInsets.zero,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: "Title",
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            )),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 18,
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
    required this.heading,
  }) : super(key: key);

  final double Mheight;
  final String heading;
  final TextEditingController bodyController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          height: Mheight * 0.09,
          margin: EdgeInsets.symmetric(vertical: Mheight * 0.01),
          child: TextFormField(
            // maxLength: 1500,
            maxLines: null,
            minLines: null,
            expands: true,
            controller: bodyController,
            autocorrect: false,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "Job Description",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
