import 'package:flutter/material.dart';

import '../../_core/constants/bytebank_colors.dart';

class HomeBackgroundWidget extends StatelessWidget {
  final List<Widget> children;
  const HomeBackgroundWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: BytebankColors.green,
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
            margin: const EdgeInsets.only(bottom: 32),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/illustrations/illustration1.png",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}
