import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Acumin Pro',
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.black,
        ),
        bodySmall: TextStyle(color: Colors.black, fontSize: 14),
        displayLarge: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
        displayMedium: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        displaySmall: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff171E26),
    fontFamily: 'Acumin Pro',
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      color: Color(0xff232C36),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
        bodySmall: TextStyle(color: Colors.white, fontSize: 14),
        displayLarge: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
        displayMedium: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        displaySmall: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
  );
}
