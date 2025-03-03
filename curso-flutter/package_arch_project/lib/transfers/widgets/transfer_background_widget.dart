import 'package:flutter/material.dart';

import '../../_core/constants/bytebank_colors.dart';

class TransferBackgroundWidget extends StatelessWidget {
  final List<Widget> children;
  const TransferBackgroundWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: BytebankColors.grey,
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
              "assets/pixels/pixels3.png",
              width: 144,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/pixels/pixels4.png",
              width: 144,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/illustrations/illustration2.png",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: SingleChildScrollView(
              child: Column(
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
