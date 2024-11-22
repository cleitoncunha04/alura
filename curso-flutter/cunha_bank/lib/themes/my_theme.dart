import 'package:cunha_bank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  primarySwatch: ThemeColors.primaryColor,
  primaryColor: ThemeColors.primaryColor,
  cardColor: ThemeColors.cardColor,
  scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
    ),
    bodyLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
  ),
  brightness: Brightness.dark,
);
