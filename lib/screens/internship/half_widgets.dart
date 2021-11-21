import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:deep_pocket_1/screens/internship/internship_page.dart';
import 'package:flutter/material.dart';

class firstHalf extends StatelessWidget {
  const firstHalf({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;
    double MWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 10, 10),
      // color: Colors.amberAccent,
      height: MHeight * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // color: Colors.amber,
            width: MWidth * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: MHeight * 0.18 * 0.05,
                ),
                Container(
                  child: const AutoSizeText(
                    'Software Development Engineer-Artificial Intelligence',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    minFontSize: 18,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // SizedBox(
                //   height: MHeight * 0.015,
                // ),
                const AutoSizeText(
                  'Rocket Flyer Technology',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  minFontSize: 14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            width: MHeight * 0.075,
            height: MHeight * 0.075,
            child: Image.network(
              "https://www.freepnglogos.com/uploads/apple-logo-png/apple-logo-png-dallas-shootings-don-add-are-speech-zones-used-4.png",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class middleButton extends StatelessWidget {
  const middleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Column(
              children: const [
                Icon(
                  Icons.star_border_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.3,
          // ),
          Column(
            children: const [
              Icon(
                Icons.share,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "Share",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
          Column(
            children: [
              Stack(
                  fit: StackFit.passthrough,
                  alignment: AlignmentDirectional.center,
                  children: const [
                    Text(
                      "23",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.brightness_1_outlined,
                      color: Colors.white,
                      size: 43,
                    ),
                  ]),
              const Text(
                "Days Left",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }
}

class internshipCarosel extends StatelessWidget {
  const internshipCarosel({
    Key? key,
    required this.MHeight,
    required this.MWidth,
  }) : super(key: key);

  final double MHeight;
  final double MWidth;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          // aspectRatio: 20 / 9,
          viewportFraction: 0.84,
          enableInfiniteScroll: false,
          height: MHeight * 0.50,
          initialPage: 1),
      items: [0, 1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              // decoration: BoxDecoration(color: Colors.amber),
              child: i == 0
                  ? aboutCompany(MHeight: MHeight, MWidth: MWidth)
                  : i == 1
                      ? enrollCard(
                          MHeight: MHeight,
                          MWidth: MWidth,
                        )
                      : jobDescribtion(MHeight: MHeight, MWidth: MWidth),
            );
          },
        );
      }).toList(),
    );
  }
}

class enrollCard extends StatelessWidget {
  enrollCard({
    required this.MHeight,
    required this.MWidth,
  });

  final double MHeight;
  final double MWidth;
  var salary = 3000;

  var line = [
    "In Depth experience on Python",
    "Experience in Tensorflow or Pytorch is a must try",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.pink,
      color: const Color.fromRGBO(11, 10, 10, 1),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(227, 216, 111, 70),
                borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
              ),
              width: double.maxFinite,
              // color: Colors.blue,
              child: const Text(
                "JOB HIGHLIGHTS",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                // color: Colors.yellow,
                borderRadius: BorderRadius.circular(7),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: const EdgeInsets.symmetric(vertical: 5),
                    //This area is used for Top Part Started
                    // color: Colors.amber,
                    // height: MHeight * 0.15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: MHeight * 0.15 * 0.14,
                        // ),

                        SizedBox(
                          height: MHeight * 0.15 * 0.14,
                        ),

                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            // color: Colors.yellow,
                            color: Color.fromRGBO(40, 40, 43, 1),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          // height: MHeight * 0.15 * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Required skill",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: MHeight * 0.15 * 0.04,
                              ),
                              Container(
                                // color: Colors.yellow,
                                height: MHeight * 0.15 * 0.8 * 0.6 +
                                    MHeight *
                                        0.15 *
                                        0.8 *
                                        0.1 *
                                        (line.length - 2),
                                child: ListView.builder(
                                    itemCount: line.length,
                                    itemBuilder: (context, i) => skill_line(
                                        MWidth: MWidth, line: line[i])),
                              )
                              // Row(
                              //   children: [
                              //     Text("- "),
                              //     Container(
                              //       // color: Colors.amber,
                              //       width: MWidth * 0.65,
                              //       child: const Text(
                              //           "In Depth experience on Python",
                              //           style: TextStyle(
                              //               fontSize: 15,
                              //               fontWeight: FontWeight.w300)),
                              //     )
                              //   ],
                              // ),
                              ,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: Colors.yellow,
                      color: Color.fromRGBO(40, 40, 43, 1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    // height: MHeight * 0.5 * 0.4,
                    // color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        jobLine(
                            MHeight: MHeight,
                            ico: Icons.work_outline,
                            MWidth: MWidth,
                            text: "0-4 Years"),
                        jobLine(
                            MHeight: MHeight,
                            ico: Icons.person_add_alt_1_outlined,
                            MWidth: MWidth,
                            text: "20"),
                        jobLine(
                            MHeight: MHeight,
                            ico: Icons.location_on_outlined,
                            MWidth: MWidth,
                            text: "Gurgaon/Gurugram, Madhya Pradesh"),
                        salary > 0
                            ? jobLine(
                                MHeight: MHeight,
                                ico: Icons.attach_money_outlined,
                                MWidth: MWidth,
                                text: "₹ " + salary.toString() + "/month")
                            : jobLine(
                                MHeight: MHeight,
                                ico: Icons.language_outlined,
                                MWidth: MWidth,
                                text: "Experience"),
                        jobLine(
                            MHeight: MHeight,
                            ico: Icons.attribution_outlined,
                            MWidth: MWidth,
                            text:
                                "Tensorflow, REST API, Open Source, Image Recognition, Machine Learning, Flask, Python")
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Container(
                    // color: Colors.yellow,
                    width: double.maxFinite,
                    child: Text("Internship Applicants 30".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class jobLine extends StatelessWidget {
  const jobLine(
      {Key? key,
      required this.ico,
      required this.MWidth,
      required this.text,
      required this.MHeight})
      : super(key: key);

  final IconData ico;
  final double MWidth;
  final String text;
  final double MHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              ico,
              color: Colors.grey,
            ),
            SizedBox(
              width: MWidth * 0.02,
            ),
            Container(
              // color: Colors.green,
              width: MWidth * 0.5,
              child: AutoSizeText(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
                minFontSize: 11,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MHeight * 0.003,
        )
      ],
    );
  }
}

class skill_line extends StatelessWidget {
  const skill_line({
    Key? key,
    required this.MWidth,
    required this.line,
  }) : super(key: key);

  final double MWidth;
  final String line;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "- ",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          // color: Colors.amber,
          width: MWidth * 0.6,
          child: AutoSizeText(
            line,
            style: const TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300),
            minFontSize: 10,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class aboutCompany extends StatelessWidget {
  const aboutCompany({
    Key? key,
    required this.MHeight,
    required this.MWidth,
  }) : super(key: key);

  final double MHeight;
  final double MWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromRGBO(11, 10, 10, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
            decoration: BoxDecoration(
              // color: Colors.yellow,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(173, 126, 59, 94),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
                ),
                width: double.maxFinite,
                // color: Colors.blue,
                child: const Text(
                  "ABOUT COMPANY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ])));
  }
}

class jobDescribtion extends StatelessWidget {
  const jobDescribtion({
    Key? key,
    required this.MHeight,
    required this.MWidth,
  }) : super(key: key);

  final double MHeight;
  final double MWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromRGBO(11, 10, 10, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
            decoration: BoxDecoration(
              // color: Colors.yellow,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(240, 125, 110, 94),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
                ),
                width: double.maxFinite,
                // color: Colors.blue,
                child: const Text(
                  "JOB DESCRIPTION",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ])));
  }
}

class internshipCard extends StatelessWidget {
  const internshipCard({
    Key? key,
    required this.title,
    required this.companyName,
    required this.imageSrc,
    required this.workfromhome,
    required this.salary,
    required this.time,
    required this.partTimeAllowed,
    required this.date,
  }) : super(key: key);

  final String title;
  final String companyName;
  final String imageSrc;
  final bool workfromhome;
  final int salary;
  final String time;
  final bool partTimeAllowed;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, internPage.route);
      },
      child: Card(
        color: const Color.fromRGBO(11, 10, 10, 1),
        child: Container(
          // color: Colors.yellow,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        companyName,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.05,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(imageSrc),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    workfromhome
                        ? Row(
                            children: const [
                              Icon(
                                Icons.home,
                                color: Colors.grey,
                              ),
                              Text(
                                " Work From Home",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        : Row(
                            children: const [
                              Icon(
                                Icons.business,
                                color: Colors.grey,
                              ),
                              Text(" Work at office",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                    Row(
                      children: [
                        salary > 0
                            ? Row(
                                children: [
                                  const Icon(
                                    Icons.payment,
                                    color: Colors.grey,
                                  ),
                                  Text(" ₹ " + salary.toString() + " /month",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              )
                            : Row(
                                children: const [
                                  Icon(
                                    Icons.language,
                                    color: Colors.grey,
                                  ),
                                  Text(" Experience",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                              size: 20,
                            ),
                            Text(" " + time,
                                style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.grey,
                        ),
                        partTimeAllowed
                            ? const Text(" Part Time Allowed",
                                style: TextStyle(color: Colors.white))
                            : const Text(" Only Full Time",
                                style: TextStyle(color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  const Icon(
                    Icons.check_circle_outline,
                    size: 25,
                    color: Colors.grey,
                  ),
                  Text(
                    " Apply by" + date,
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
