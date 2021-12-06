import 'package:deep_pocket_1/screens/noticeboard/notiboard_home.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_saved.dart';
import 'package:flutter/material.dart';

class NoticeTab extends StatefulWidget {
  static const route = '/noticeboard_tab';

  const NoticeTab({Key? key}) : super(key: key);
  @override
  _NoticeTabState createState() => _NoticeTabState();
}

class _NoticeTabState extends State<NoticeTab> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const noticeBoard(),
    const noticeSaved(),
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
            icon: Icon(Icons.new_label_outlined),
            activeIcon: Icon(Icons.new_label),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            activeIcon: Icon(Icons.bookmark),
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
