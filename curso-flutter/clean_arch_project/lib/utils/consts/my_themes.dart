import 'package:flutter/material.dart';

class MyThemes {
  MyThemes._();

  static final themeData = ThemeData(
    colorSchemeSeed: ThemeColors.primaryColor,
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Philosopher',
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 24,
        overflow: TextOverflow.clip,
      ),
      bodyMedium: TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      titleSmall:
          TextStyle(fontSize: 24, color: ThemeColors.iconColor, shadows: [
        BoxShadow(
          color: Color.fromARGB(29, 3, 101, 140),
          offset: Offset(-4, -4),
          spreadRadius: 10,
          blurRadius: 10,
        ),
        BoxShadow(
          color: Color.fromARGB(29, 3, 101, 140),
          offset: Offset(4, 4),
          spreadRadius: 10,
          blurRadius: 10,
        )
      ]),
      titleMedium: TextStyle(
        fontSize: 28,
      ),
    ),
  );
}

class ThemeColors {
  ThemeColors._();

  static const MaterialColor primaryColor = Colors.blue;
  static const Color iconColor = Color(0xFF00497D);
  static const Color iconBackground = Color.fromARGB(255, 27, 27, 27);
  static const Color wrapColor = Color(0xFF3B4858);
  static const Color wrapBorderColor = Color(0xFF938F99);
  static const Color detailsBackground = Color(0xFF404040);
}
