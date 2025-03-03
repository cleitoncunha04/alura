import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransferTitleWidget extends StatelessWidget {
  const TransferTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Nova Transação",
      style: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}
