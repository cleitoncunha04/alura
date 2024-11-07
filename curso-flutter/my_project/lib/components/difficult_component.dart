import 'package:flutter/material.dart';

class DifficultyComponent extends StatelessWidget {
  const DifficultyComponent({
    super.key,
    required this.difficulty,
  });

  final int difficulty;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        Icons.star,
        size: 15,
        color: (difficulty >= 1) ? Colors.amberAccent : Colors.grey[300],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: (difficulty >= 2) ? Colors.amberAccent : Colors.grey[300],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: (difficulty >= 3) ? Colors.amberAccent : Colors.grey[300],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: (difficulty >= 4) ? Colors.amberAccent : Colors.grey[300],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: (difficulty >= 5) ? Colors.amberAccent : Colors.grey[300],
      ),
    ]);
  }
}
