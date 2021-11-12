import 'package:flutter/material.dart';

import 'package:deep_pocket_1/screens/event/mock_event.dart';
import 'event_widgets.dart';

class eventMainScreen extends StatelessWidget {
  static const route = '/eventTabs/eventMainScreen';
  // const eventMainScreen({Key? key}) : super(key: key);

  List<event> upcomingEvents = [];

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MHeight * 0.77,
            child: ListView.builder(
                itemCount: upcomingEvents.length,
                itemBuilder: (context, i) => eventCard(
                      upcomingEvent: upcomingEvents[i],
                      MHeight: MHeight,
                    ))),
      ),
      backgroundColor: const Color.fromRGBO(11, 10, 10, 1),
    );
  }
}
