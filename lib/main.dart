import 'package:deep_pocket_1/screens/event/create_event.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_create.dart';
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

import 'package:deep_pocket_1/screens/resources/book/book_viewer.dart';
import 'package:deep_pocket_1/screens/resources/resources_tab_screen.dart';

import 'package:deep_pocket_1/tabs_screen.dart';

import 'package:deep_pocket_1/screens/post/user_input.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login-signup/login.dart';
import 'models/mock_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(MaterialApp(home: email == null ? LoginScreen() : MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => mockData()),
      ],
      child: MaterialApp(
          title: "APP",
          theme: ThemeData(
            textSelectionTheme: const TextSelectionThemeData(
                selectionColor: Colors.yellow,
                selectionHandleColor: Colors.blue),
          ),
          home: TabsScreen(),
          debugShowCheckedModeBanner: false,
          routes: {
            userInput.route: (ctx) => userInput(),
            feedScreen.route: (ctx) => feedScreen(),

            clubsScreen.route: (ctx) => clubsScreen(),
            // eventSreen.route: (ctx) => eventSreen(),
            facultyScreen.route: (ctx) => facultyScreen(),
            freeCources.route: (ctx) => freeCources(),
            courseList.route: (ctx) => courseList(),
            courseScreen.route: (ctx) => courseScreen(),
            internShips.route: (ctx) => internShips(),
            internPage.route: (ctx) => internPage(),
            TableEventsExample.route: (ctx) => TableEventsExample(),
            eventTabs.route: (ctx) => eventTabs(),
            eventScreen.route: (ctx) => eventScreen(),
            noticeBoard.route: (ctx) => noticeBoard(),
            noticeScreen.route: (ctx) => noticeScreen(),
            clubDetail.route: (ctx) => clubDetail(),
            resourcesTab.route: (ctx) => resourcesTab(),
            bookViewer.route: (ctx) => bookViewer(),
            schoolScreen.route: (ctx) => schoolScreen(),
            facultyPage.route: (ctx) => facultyPage(),
            editProfile.route: (ctx) => editProfile(),
            postPage.route: (ctx) => postPage(),
            editPost.route: (ctx) => editPost(),
            createNotice.route: (ctx) => createNotice(),
            createEvent.route: (ctx) => createEvent()
          }),
    );
  }
}
