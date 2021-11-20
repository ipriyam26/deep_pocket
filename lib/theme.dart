import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      backgroundColor: const Color(0xffF7DAA3),
      cardColor: const Color(0xffFDF5E6),
      // bottomAppBarColor: const Color(0xffF2C063),
      secondaryHeaderColor: Colors.black,
      canvasColor: const Color(0xffFCFFF0),
      primaryColor: const Color(0xFFFFF0E2),
      textTheme: const TextTheme(
          subtitle2: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          headline1: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          headline6: TextStyle(
              color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(color: Colors.black)),
      primaryIconTheme: const IconThemeData(color: Color(0xffEE5149)),
      splashColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.black));
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );
}
