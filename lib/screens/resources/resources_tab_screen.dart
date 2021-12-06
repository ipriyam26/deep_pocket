// ignore_for_file: camel_case_types

import 'package:deep_pocket_1/screens/resources/video_resources.dart';
import 'package:flutter/material.dart';

import 'book/book_resources.dart';

class resourcesTab extends StatefulWidget {
  static const route = '/resources';

  const resourcesTab({Key? key}) : super(key: key);
  @override
  _resourcesTabState createState() => _resourcesTabState();
}

class _resourcesTabState extends State<resourcesTab> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const bookResources(),
    videoResources(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
        // backgroundColor: const Color.fromRGBO(16, 15, 14, 1) ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[800],
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
