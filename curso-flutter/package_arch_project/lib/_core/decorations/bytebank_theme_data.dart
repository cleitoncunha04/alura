import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/bytebank_colors.dart';

ThemeData getBytebankThemeData() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: BytebankColors.green,
    scaffoldBackgroundColor: BytebankColors.lightgrey,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 96,
      backgroundColor: BytebankColors.black,
      centerTitle: true,
      elevation: 0,
      foregroundColor: BytebankColors.green,
    ),
    textTheme: GoogleFonts.interTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(BytebankColors.green),
      ),
    ),
  );
}
