import 'package:flutter/material.dart';
import 'package:package_arch_project/_core/widgets/height_margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../_core/constants/bytebank_colors.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Olá, Joana! :)",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            color: BytebankColors.white,
            fontSize: 25,
          ),
        ),
        const HeightMargin(MarginType.large),
        Text(
          DateFormat('EEEE, dd/MM/yyyy', "pt_BR").format(DateTime.now()),
          style: const TextStyle(
            color: BytebankColors.white,
            fontSize: 13,
          ),
        ),
        const HeightMargin(MarginType.large),
      ],
    );
  }
}
