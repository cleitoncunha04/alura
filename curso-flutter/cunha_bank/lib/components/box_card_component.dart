import 'package:flutter/material.dart';

class BoxCardComponent extends StatelessWidget {
  final Widget boxContanet;

  const BoxCardComponent({
    super.key,
    required this.boxContanet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[3],
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: boxContanet,
    );
  }
}
