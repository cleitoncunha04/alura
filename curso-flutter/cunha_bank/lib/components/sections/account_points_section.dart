import 'package:cunha_bank/components/box_card_component.dart';
import 'package:cunha_bank/components/color_dot_component.dart';
import 'package:cunha_bank/components/content_division_component.dart';
import 'package:cunha_bank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class AccountPointsSection extends StatelessWidget {
  const AccountPointsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: Text(
              'Account points',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const BoxCardComponent(
            boxContanet: AccountPointsComponent(),
          ),
        ],
      ),
    );
  }
}

class AccountPointsComponent extends StatelessWidget {
  const AccountPointsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Total points'),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Text(
            '2,733 pts',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const ContentDivisionComponent(),
        const Padding(
          padding: EdgeInsets.only(
            top: 8,
          ),
          child: Text(
            'Tasks',
            style: TextStyle(
              fontSize: 21,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: ColorDotComponent(
                  color: ThemeColors.accountPoints['shipping'],
                ),
              ),
              const Text('Free shipping: 12,333 pts'),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                right: 8,
              ),
              child: ColorDotComponent(
                color: ThemeColors.accountPoints['streaming'],
              ),
            ),
            const SizedBox(
              width: 300,
              child: Text(
                'Streaming for 01 month free: 6,751 pts',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
