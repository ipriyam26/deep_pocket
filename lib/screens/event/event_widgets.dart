import 'package:deep_pocket_1/screens/event/event_screen.dart';
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

  final event upcomingEvent;
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
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(upcomingEvent.imgsrc),
              ),
            ),
            child: Column(
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
                            bottom: MediaQuery.of(context).size.width * 0.05),
                        height: MHeight * 0.7 * 0.6 * 0.15,
                        width: MediaQuery.of(context).size.width * 0.25 +
                            (upcomingEvent.host.length - 2) *
                                MediaQuery.of(context).size.width *
                                0.08,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: upcomingEvent.host.length,
                            itemBuilder: (context, i) => Align(
                                  child: Container(
                                      width: MHeight * 0.7 * 0.6 * 0.14,
                                      height: MHeight * 0.7 * 0.6 * 0.14,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.white,
                                        ),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              upcomingEvent.host[i].img),
                                        ),
                                      )),
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
                              upcomingEvent.date.day.toString(),
                              style: const TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat('MMMM', 'en_US')
                                  .format(upcomingEvent.date)
                                  .substring(0, 3)
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.15),
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
                            upcomingEvent.Name,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            upcomingEvent.title,
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: const Icon(Icons.favorite_outline,
                      //         size: 35, color: Colors.redAccent))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
