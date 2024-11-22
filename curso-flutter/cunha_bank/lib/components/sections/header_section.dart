import 'package:cunha_bank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
        gradient: const LinearGradient(
          colors: ThemeColors.headerGradientColors,
          stops: [0, 1],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        boxShadow: kElevationToShadow[3],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: 'R\$ ',
                    children: <TextSpan>[
                      TextSpan(
                        text: '1.233,47',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Available balance',
                )
              ],
            ),
            const Icon(
              Icons.account_circle_rounded,
              size: 42,
            ),
          ],
        ),
      ),
    );
  }
}
