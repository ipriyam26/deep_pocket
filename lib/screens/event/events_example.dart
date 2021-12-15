// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

// ignore_for_file: unused_field



import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deep_pocket_1/screens/event/get_event.dart';
import 'package:deep_pocket_1/screens/event/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:table_calendar/table_calendar.dart';
import 'event_widgets.dart';


class TableEventsExample extends StatefulWidget {
  static const route = '/eventTabs/eventScreenex';

  const TableEventsExample({Key? key}) : super(key: key);

  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  final getEvent = Get.put(EventController());
  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }

    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  List<QueryDocumentSnapshot<Map<String, dynamic>>> _getEventsForDay(
      DateTime day) {
    // Implementation example
    return getEvent.snapshotNoFuture!.docs.where((element) {
      return isSameDay(
          DateTime.parse(element.data()['StartingDate'].toDate().toString()),
          day);
    }).toList();
  }

  List<QueryDocumentSnapshot<Map<String, dynamic>>> _getEventsForRange(
      DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 10, 10, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.88,
          child: Column(
            children: [
              TableCalendar<QueryDocumentSnapshot<Map<String, dynamic>>>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                // rangeStartDay: _rangeStart,
                // rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                // calendarStyle: CalendarStyle(
                //   // Use `CalendarStyle` to customize the UI
                //   outsideDaysVisible: false,
                // ),

                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                  formatButtonVisible: false,
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.white),
                    weekendStyle: TextStyle(color: Colors.white)),
                calendarStyle: const CalendarStyle(
                    selectedTextStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    markersAnchor: 1,
                    markersMaxCount: 1,
                    markerSizeScale: 1,
                    todayDecoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: Colors.pink
                        // backgroundBlendMode: BlendMode.lighten,
                        ),
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFB4E51),
                      // backgroundBlendMode: BlendMode.lighten,
                    ),
                    markerDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.blue,
                        backgroundBlendMode: BlendMode.lighten,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(218, 112, 214, 0.7),
                            // Color.fromRGBO(135, 206, 250, 1),
                            Color.fromRGBO(30, 144, 255, 0.95),
                          ],
                        )),
                    cellPadding: EdgeInsets.all(10),
                    outsideDaysVisible: false,
                    weekendTextStyle: TextStyle(color: Colors.white),
                    defaultTextStyle: TextStyle(color: Colors.white)),

                onDaySelected: _onDaySelected,
                onRangeSelected: _onRangeSelected,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              const SizedBox(height: 2.0),
              ValueListenableBuilder<
                  List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return eventCard(
                          upcomingEvent: value[index],
                          MHeight: MediaQuery.of(context).size.height);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
