import 'package:flutter/material.dart';

class HeightMargin extends StatelessWidget {
  final MarginType marginType;
  const HeightMargin(this.marginType, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (marginType == MarginType.large)
          ? 32
          : (marginType == MarginType.small)
              ? 16
              : 8,
    );
  }
}

enum MarginType {
  tiny,
  small,
  large,
}
