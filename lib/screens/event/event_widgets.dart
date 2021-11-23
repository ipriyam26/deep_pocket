import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/screens/event/event_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'mock_event.dart';

class eventCard extends StatelessWidget {
  const eventCard({
    Key? key,
    required this.upcomingEvent,
    required this.MHeight,
    // required this.i,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> upcomingEvent;
  final MHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, eventScreen.route,
            arguments: upcomingEvent);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: MHeight * 0.7 * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: NetworkImage(upcomingEvent['Image']),
              // ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    height: MHeight * 0.7 * 0.6,
                    imageUrl: upcomingEvent['Image'],
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                            color: Colors.pink,
                            value: downloadProgress.progress),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // color: Colors.blue,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.06,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05),
                            height: MHeight * 0.7 * 0.6 * 0.15,
                            width: MediaQuery.of(context).size.width * 0.25 +
                                (upcomingEvent['HostImage'].length - 2) *
                                    MediaQuery.of(context).size.width *
                                    0.08,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: upcomingEvent['HostImage'].length,
                                itemBuilder: (context, i) => Align(
                                      child: Container(
                                        width: MHeight * 0.7 * 0.6 * 0.14,
                                        height: MHeight * 0.7 * 0.6 * 0.14,
                                        child: ClipOval(
                                          child: Container(
                                            padding: EdgeInsets.all(2),
                                            color: Colors.white,
                                            child: ClipOval(
                                              child: CachedNetworkImage(
                                                fadeInDuration: const Duration(
                                                    microseconds: 0),
                                                fadeOutDuration: const Duration(
                                                    microseconds: 2),
                                                placeholder: (context, url) =>
                                                    const CupertinoActivityIndicator(),
                                                imageUrl:
                                                    upcomingEvent['HostImage']
                                                            [i]
                                                        .toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      widthFactor: 0.8,
                                    )),
                          ),
                          Container(
                            height: MHeight * 0.7 * 0.6 * 0.19,
                            width: MediaQuery.of(context).size.width * 0.16,
                            margin: EdgeInsets.symmetric(
                                horizontal: MHeight * 0.7 * 0.6 * 0.07),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateTime.parse(upcomingEvent['StartingDate']
                                          .toDate()
                                          .toString())
                                      .day
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat('MMMM', 'en_US')
                                      .format(DateTime.parse(
                                          upcomingEvent['StartingDate']
                                              .toDate()
                                              .toString()))
                                      .substring(0, 3)
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      // color: Colors.yellow,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(MHeight * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                upcomingEvent['Org'],
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                upcomingEvent['Title'],
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
