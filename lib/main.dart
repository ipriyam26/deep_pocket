import 'package:deep_pocket_1/screens/Nearby/nearby_add.dart';

import 'package:deep_pocket_1/screens/Nearby/nearby_tab.dart';
import 'package:deep_pocket_1/screens/Nearby/place.dart';
import 'package:deep_pocket_1/screens/event/create_event.dart';
import 'package:deep_pocket_1/screens/internship/internship_create.dart';
import 'package:deep_pocket_1/screens/login-signup/login.dart';

import 'package:deep_pocket_1/screens/noticeboard/notice_create.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_tab.dart';
import 'package:deep_pocket_1/screens/post/edit_post.dart';
import 'package:deep_pocket_1/screens/profile/edit_profile.dart';
import 'package:deep_pocket_1/screens/club/club_detail_screen.dart';
import 'package:deep_pocket_1/screens/club/clubs_screen.dart';
import 'package:deep_pocket_1/screens/event/even_tabs.dart';
import 'package:deep_pocket_1/screens/event/event_screen.dart';
import 'package:deep_pocket_1/screens/event/events_example.dart';
import 'package:deep_pocket_1/screens/faculty/faculty_page.dart';

import 'package:deep_pocket_1/screens/faculty/faculty_screen.dart';
import 'package:deep_pocket_1/screens/faculty/school_screen.dart';
import 'package:deep_pocket_1/screens/post/feed_screen.dart';
import 'package:deep_pocket_1/screens/freecourse/course_list.dart';
import 'package:deep_pocket_1/screens/freecourse/course_screen.dart';
import 'package:deep_pocket_1/screens/freecourse/freecourses_screen.dart';
import 'package:deep_pocket_1/screens/internship/internship_page.dart';
import 'package:deep_pocket_1/screens/internship/interships_screen.dart';
import 'package:deep_pocket_1/screens/post/new_post_page.dart';
import 'package:deep_pocket_1/screens/noticeboard/notiboard_home.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_screen.dart';
import 'package:deep_pocket_1/screens/profile/search_profile_screen.dart';
import 'package:deep_pocket_1/screens/profile/search_user.dart';

import 'package:deep_pocket_1/screens/resources/book/book_viewer.dart';
import 'package:deep_pocket_1/screens/resources/resources_tab_screen.dart';

import 'package:deep_pocket_1/tabs_screen.dart';

import 'package:deep_pocket_1/screens/post/user_input.dart';


import 'package:deep_pocket_1/widgets/fullscreen_image.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(
      MaterialApp(home: email == null ? const LoginScreen() : const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "APP",
        // theme: Themes.light,
        // darkTheme: Themes.dark,
        home: const TabsScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          TabsScreen.route: (ctx) => const TabsScreen(),
          place.route: (ctx) => const  place(),
          nearbyTab.route: (ctx) => const nearbyTab(),
          NoticeTab.route: (ctx) => const NoticeTab(),
          SearchUser.route: (ctx) => const SearchUser(),
          userInput.route: (ctx) => userInput(),
          feedScreen.route: (ctx) => feedScreen(),
          clubsScreen.route: (ctx) => const clubsScreen(),
          facultyScreen.route: (ctx) => const facultyScreen(),
          freeCources.route: (ctx) => const freeCources(),
          courseList.route: (ctx) => const courseList(),
          courseScreen.route: (ctx) => const courseScreen(),
          internShips.route: (ctx) => const internShips(),
          internPage.route: (ctx) => const internPage(),
          TableEventsExample.route: (ctx) =>const  TableEventsExample(),
          eventTabs.route: (ctx) => const eventTabs(),
          eventScreen.route: (ctx) => const eventScreen(),
          noticeBoard.route: (ctx) => const noticeBoard(),
          noticeScreen.route: (ctx) =>const  noticeScreen(),
          clubDetail.route: (ctx) => const clubDetail(),
          resourcesTab.route: (ctx) => const resourcesTab(),
          bookViewer.route: (ctx) => const bookViewer(),
          schoolScreen.route: (ctx) => const schoolScreen(),
          facultyPage.route: (ctx) => const facultyPage(),
          editProfile.route: (ctx) => const editProfile(),
          postPage.route: (ctx) => postPage(),
          editPost.route: (ctx) => const editPost(),
          createNotice.route: (ctx) => createNotice(),
          createEvent.route: (ctx) => createEvent(),
          fullImage.route: (ctx) =>const  fullImage(),
          searchProfileScreen.route: (ctx) =>const  searchProfileScreen(),
          internCreate.route: (ctx) => const internCreate(),
          NearbAdd.route: (ctx) => const NearbAdd()
        });
  }
}
