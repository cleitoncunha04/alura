import 'package:flutter/material.dart';

class ThemeColors {
  ThemeColors._(); // Construtor privado, para que a classe não seja instanciada

  static const MaterialColor primaryColor = Colors.teal;

  static const Color cardColor =
      Color.fromRGBO(56, 56, 56, 1); // Colors.grey[800]

  static const Color scaffoldBackgroundColor =
      Color.fromRGBO(40, 40, 40, 1); // Colors.grey[900] + escuro (48 -> 40)

  static const List<Color> headerGradientColors = <Color>[
    Color(0xff44a08d),
    Color(0xff093637),
  ];

  static const Map<String, Color> recentActivities = {
    'spent': Color.fromRGBO(255, 175, 29, 1),
    'income': Colors.tealAccent,
  };

  static const Color divisionComponentColor = Color.fromRGBO(166, 166, 166, 1);
  
  static const Map<String, Color> accountPoints = {
    'shipping': primaryColor,
    'streaming': Colors.tealAccent,
  };
}
