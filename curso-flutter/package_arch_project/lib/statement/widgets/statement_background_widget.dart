import 'package:flutter/material.dart';

import '../../_core/constants/bytebank_colors.dart';

class StatementBackgroundWidget extends StatelessWidget {
  final List<Widget> children;
  const StatementBackgroundWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: BytebankColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/pixels/pixels1.png",
              width: 144,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/pixels/pixels2.png",
              width: 144,
            ),
          ),
          Container(
            color: BytebankColors.white.withAlpha(200),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children),
          ),
        ],
      ),
    );
  }
}
