import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/models/mock_data.dart';
import 'package:deep_pocket_1/models/user_model.dart';
import 'package:deep_pocket_1/screens/post/feed_screen.dart';
import 'package:deep_pocket_1/screens/menu-pages/menu_pages.dart';
import 'package:deep_pocket_1/screens/post/user_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'screens/profile/profile_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: ,
//       body: ,
//     );
//   }
// }

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    feedScreen(),
    Menu(),
    // userInput(),
    profileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<UserModel> getUserData() async {
    var doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return UserModel.fromMap(doc.data());
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<UserModel>(
      initialData:
          UserModel(Name: "Loading", Image: "loading", CollegeName: "loading"),
      create: (_) => getUserData(),
      child: Scaffold(
          // appBar: AppBar(
          //   title: Text(pages[_selectedindex]['Title'].toString()),
          // ),
          drawer: const Drawer(
              // Populate the Drawer in the next step.
              ),
          body: Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
              // backgroundColor: const Color.fromRGBO(16, 15, 14, 1) ,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.space_dashboard_outlined, size: 30),
                  activeIcon: Icon(Icons.space_dashboard, size: 30),
                  label: '',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.pages_outlined, size: 30),
                  activeIcon: Icon(Icons.pages, size: 30),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.add,
                //     size: 30,
                //   ),
                //   activeIcon: Icon(Icons.add_circle, size: 30),
                //   label: '',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 30),
                  activeIcon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  label: '',
                ),
              ],
              selectedIconTheme:
                  IconThemeData(size: 32, color: Colors.pink[800]),
              currentIndex: _selectedIndex,
              // selectedItemColor: Colors.pink[800],
              unselectedItemColor: Colors.white,
              onTap: _onItemTapped,
            ),
          )

          //  pages[_selectedindex]['Body'] as Widget,
          // bottomNavigationBar: CurvedNavigationBar(
          //   height: 60,
          //   color: Colors.blue,
          //   backgroundColor: Colors.white,
          //   buttonBackgroundColor: Colors.blue,
          //   items: const <Widget>[
          //     Icon(Icons.category, color: Colors.white, size: 30),
          //     Icon(Icons.person, color: Colors.white, size: 30),
          //     // Icon(Icons.compare_arrows, size: 30),
          //   ],
          //   onTap: (index) {
          //     return _selectedpage(index);
          //   },
          ),
    );
  }
}