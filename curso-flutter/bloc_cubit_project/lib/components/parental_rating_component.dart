import 'package:bloc_cubit_project/models/classification_enum.dart';
import 'package:flutter/material.dart';

class ParentalRatingComponent extends StatelessWidget {
  const ParentalRatingComponent({super.key, required this.classification});
  final ClassificationEnum? classification;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: classification != null ? classification!.color : Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(
        right: 8.0,
      ),
      child: Center(
        child: Text(
          classification != null ? classification!.code : '?',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
