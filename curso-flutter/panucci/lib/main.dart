import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panucci/screens/home_screen.dart';

void main() {
  runApp(const PanucciRistorante());
}

class PanucciRistorante extends StatelessWidget {
  const PanucciRistorante({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Panucci Ristorante",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.purple,
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
