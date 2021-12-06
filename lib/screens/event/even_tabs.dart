// ignore_for_file: camel_case_types

import 'package:deep_pocket_1/admin.dart';
import 'package:deep_pocket_1/screens/event/create_event.dart';
import 'package:deep_pocket_1/screens/event/even_main_screen.dart';
import 'package:deep_pocket_1/screens/event/events_example.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class eventTabs extends StatefulWidget {
  static const route = '/eventTabs';

  const eventTabs({Key? key}) : super(key: key);
  @override
  _eventTabsState createState() => _eventTabsState();
}

class _eventTabsState extends State<eventTabs> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    eventMainScreen(),
    const TableEventsExample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: userRoleController(),
        builder: (userRoleController rolecontroller) {
          return Scaffold(
            appBar: AppBar(
                actions: [
                  if (rolecontroller.specialAccess!
                      .contains(FirebaseAuth.instance.currentUser!.uid))
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(createEvent.route);
                        },
                        icon: const Icon(Icons.add))
                ],
                title: const Text(
                  'Event',
                ),
                backgroundColor: const Color.fromRGBO(16, 15, 1, 1)),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
              // backgroundColor: const Color.fromRGBO(16, 15, 14, 1) ,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.pink[800],
              unselectedItemColor: Colors.white,
              onTap: _onItemTapped,
            ),
          );
        });
  }
}
