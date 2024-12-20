import 'package:flutter/material.dart';

enum ClassificationEnum {
  livre('Livre', Colors.green, 'L'),
  naoRecomendado10('10', Colors.blue, '10'),
  naoRecomendado12('12', Color(0xFFF8DA00), '12'),
  naoRecomendado14('14', Colors.orange, '14'),
  naoRecomendado16('16', Colors.red, '16'),
  naoRecomendado18('18', Colors.black, '18');

  final String classification;
  final String code;
  final Color color;

  const ClassificationEnum(
    this.classification,
    this.color,
    this.code,
  );
}
