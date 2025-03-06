import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.imageName,
    required this.label,
  });

  final String imageName;
  final String label;
  static const String imagePath = 'assets/images/';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          '$imagePath$imageName',
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w500,
            fontFamily: 'Bigelow Rules',
          ),
        ),
      ],
    );
  }
}
