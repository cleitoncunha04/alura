import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final Widget boxCardBody;

  const BoxCard({super.key, required this.boxCardBody});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: kElevationToShadow[2],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: boxCardBody,
      ),
    );
  }
}
