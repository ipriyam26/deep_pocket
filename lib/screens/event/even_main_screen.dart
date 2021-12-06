// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/screens/event/get_event.dart';
import 'package:flutter/material.dart';

import 'package:deep_pocket_1/screens/event/mock_event.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'event_widgets.dart';

class eventMainScreen extends StatelessWidget {
  static const route = '/eventTabs/eventMainScreen';
  // const eventMainScreen({Key? key}) : super(key: key);

  List<event> upcomingEvents = [];

  eventMainScreen({Key? key}) : super(key: key);

  bool isAfterToday(DateTime? b) {
    DateTime a = DateTime.now();
    if (b == null) {
      return false;
    }

    if (a.year < b.year) {
      return true;
    }
    if (a.month < b.month) {
      return true;
    }
    if (a.day <= b.day) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final MHeight = MediaQuery.of(context).size.height;
    upcomingEvents =
        mockEvent().mockE.where((day) => isAfterToday(day.date)).toList();

    upcomingEvents.sort((a, b) => a.date.compareTo(b.date));
    return GetBuilder(
        init: EventController(),
        builder: (EventController eventController) {
          return Scaffold(
            body: SingleChildScrollView(
              child: FutureBuilder(
                  future: eventController.snapshot,
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                        height: MHeight * 0.82,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, i) => eventCard(
                                  upcomingEvent: snapshot.data!.docs[i],
                                  MHeight: MHeight,
                                )));
                  }),
            ),
            backgroundColor: const Color.fromRGBO(11, 10, 10, 1),
          );
        });
  }
}
