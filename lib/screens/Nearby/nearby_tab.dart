import 'package:deep_pocket_1/admin.dart';
import 'package:deep_pocket_1/screens/Nearby/nearby_favourite.dart';
import 'package:deep_pocket_1/screens/Nearby/nearby_first.dart';
import 'package:deep_pocket_1/screens/event/create_event.dart';
import 'package:deep_pocket_1/screens/event/even_main_screen.dart';
import 'package:deep_pocket_1/screens/event/events_example.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class nearbyTab extends StatefulWidget {
  static const route = '/nearbyTab';
  @override
  _nearbyTabState createState() => _nearbyTabState();
}

class _nearbyTabState extends State<nearbyTab> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[nearBy(), nearbyFav()];

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
                  icon: Icon(Icons.favorite),
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
