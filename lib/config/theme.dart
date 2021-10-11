import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.indigo,
    primaryColor: const Color.fromRGBO(166, 177, 225, 1),
    primaryColorDark: const Color.fromRGBO(66, 72, 116, 1),
    primaryColorLight: const Color.fromRGBO(220, 214, 247, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(244, 238, 255, 1),
    canvasColor: const Color.fromRGBO(244, 238, 255, 1),
    bottomAppBarColor: Colors.indigo[200],
    backgroundColor: const Color(0xFFF5F5F5),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      headline3: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      headline4: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headline5: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline6: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    ),
  );
}
