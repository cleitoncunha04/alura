import 'package:cunha_bank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class ContentDivisionComponent extends StatelessWidget {
  const ContentDivisionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      decoration: BoxDecoration(
        color: ThemeColors.divisionComponentColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
