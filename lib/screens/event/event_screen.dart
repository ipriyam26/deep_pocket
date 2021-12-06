// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class eventScreen extends StatelessWidget {
  // const eventScreen({Key? key}) : super(key: key);
  static const route = 'even_tabs/event_screen';

  const eventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    final details = ModalRoute.of(context)!.settings.arguments
        as DocumentSnapshot<Map<String, dynamic>>;
    int applied = details.data()!['Applied'] ?? 0;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.white.withOpacity(0.1),
          onPressed: () async {
            final url = details.data()!['Link'];
            if (await canLaunch(url!)) {
              await FirebaseFirestore.instance
                  .collection("Events")
                  .doc(details.id)
                  .update({'Applied': (applied + 1)});
              await launch(
                url,
                forceSafariVC: true,
                forceWebView: true,
                enableJavaScript: true,
              );
            }
          },
          label: Text(
            "Apply".toUpperCase(),
          )),
      backgroundColor: const Color.fromRGBO(27, 18, 18, 1),
      appBar: AppBar(
          title: Text(
            details['Title'],
          ),
          backgroundColor: const Color.fromRGBO(16, 15, 1, 1)),
      body: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: details['Image'],
                height: MSize.height * 0.7 * 0.6,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Image.network(
                details['Image'],
                height: MSize.height * 0.7 * 0.6,
                width: MSize.width,
                fit: BoxFit.fill,
              ),
              Container(
                height: MSize.height * 0.7 * 0.6,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.6, 0.85, 1.0],
                  colors: [
                    Color.fromRGBO(27, 18, 18, 0.1),
                    Color.fromRGBO(27, 18, 18, 0.3),
                    Color.fromRGBO(27, 18, 18, 0.8),
                    Color.fromRGBO(27, 18, 18, 1),
                  ],
                )),
                child: Container(
                  color: Colors.black.withOpacity(0.15),
                  // color: Colors.yellow,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                      left: MSize.height * 0.02, bottom: MSize.height * 0.025),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details['Org'],
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: MSize.height * 0.01,
                      ),
                      Text(
                        details['Title'],
                        style: const TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MSize.height * 0.02,
          ),
          CarouselSlider(
            options: CarouselOptions(
                // aspectRatio: 20 / 9,
                viewportFraction: 0.99,
                enableInfiniteScroll: false,
                height: MSize.height * 0.7 * 0.6,
                initialPage: 0),
            items: [0, 1].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MSize.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: i == 0
                          ? dateHost(MSize: MSize, details: details)
                          : aboutEvent(MSize: MSize, details: details));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class aboutEvent extends StatelessWidget {
  const aboutEvent({
    Key? key,
    required this.MSize,
    required this.details,
  }) : super(key: key);

  final Size MSize;
  final DocumentSnapshot<Map<String, dynamic>> details;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.symmetric(
        horizontal: MSize.height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("ABOUT THE EVENT",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          const Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: MSize.height * 0.7 * 0.6 * 0.04,
          ),
          Text(details['Description'],
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}

class dateHost extends StatelessWidget {
  const dateHost({
    Key? key,
    required this.MSize,
    required this.details,
  }) : super(key: key);

  final Size MSize;
  final DocumentSnapshot<Map<String, dynamic>> details;
  @override
  Widget build(BuildContext context) {
    int applied = details.data()!['Applied'] ?? 0;
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(
          right: MSize.height * 0.02,
          left: MSize.height * 0.02,
          bottom: MSize.height * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                  DateFormat('d MMM y').format(DateTime.parse(
                      details['StartingDate'].toDate().toString())),
                  style: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
              if (details['EndingDate'] != null)
                Text(
                    " - " +
                        DateFormat('d MMM y').format(DateTime.parse(
                            details['EndingDate'].toDate().toString())),
                    style: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w300))
            ],
          ),
          SizedBox(height: MSize.height * 0.01),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            if (DateFormat('EEEE').format(DateTime.parse(
                        details['StartingDate'].toDate().toString())) ==
                    'Saturday' ||
                DateFormat('EEEE').format(DateTime.parse(
                        details['StartingDate'].toDate().toString())) ==
                    'Sunday')
              const SizedBox(
                // width: double.maxFinite,
                child: Text('Weekend',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300)),
              )
            else
              const Text('Weekday',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
            Text(
              "Applied : " + applied.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 17),
            )
          ]),
          SizedBox(height: MSize.height * 0.01),
          const Divider(
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text("HOST",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            // color: Colors.pink,
            height: MSize.height * 0.2,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: details['HostImage'].length,
                itemBuilder: (context, i) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SizedBox(
                        height: MSize.height * 0.055,
                        width: MSize.height * 0.055,
                        child: ClipOval(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            color: Colors.white,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(microseconds: 0),
                                fadeOutDuration:
                                    const Duration(microseconds: 2),
                                placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(),
                                imageUrl: details['HostImage'][i].toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(details['HostName'][i],
                          style: const TextStyle(
                              // fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      subtitle: Text(details['HostRole'][i],
                          style: const TextStyle(
                              // fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300)),
                    )),
          ),
        ],
      ),
    );
  }
}
