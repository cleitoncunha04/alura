import 'package:cunha_bank/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme = ThemeData(
  primarySwatch: ThemeColors.primaryColor,
  primaryColor: ThemeColors.primaryColor,
  cardColor: ThemeColors.cardColor,
  scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor,
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 18,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    textStyle: GoogleFonts.montserrat(
      color: ThemeColors.recentActivities['income'],
      fontSize: 16,
    ),
  )),
  brightness: Brightness.dark,
);
