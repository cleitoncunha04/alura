import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatementTitleWidget extends StatelessWidget {
  const StatementTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Extrato",
      textAlign: TextAlign.left,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}
