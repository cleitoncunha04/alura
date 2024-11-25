import 'package:cunha_bank/components/box_card_component.dart';
import 'package:cunha_bank/components/color_dot_component.dart';
import 'package:cunha_bank/components/content_division_component.dart';
import 'package:cunha_bank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class RecentActivitiesSection extends StatelessWidget {
  const RecentActivitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: BoxCardComponent(boxContanet: _RecentActivitiesContent()),
    );
  }
}

class _RecentActivitiesContent extends StatelessWidget {
  const _RecentActivitiesContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ColorDotComponent(
                        color: ThemeColors.recentActivities['spent'],
                      ),
                    ),
                    const Text('Spent'),
                  ],
                ),
                Text(
                  'R\$ 997,43',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ColorDotComponent(
                        color: ThemeColors.recentActivities['income'],
                      ),
                    ),
                    const Text('Income'),
                  ],
                ),
                Text(
                  'R\$ 1.297,43',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 24,
            bottom: 16,
          ),
          child: Text('Spent limits: R\$ 337,41'),
        ),
        LinearProgressIndicator(
          value: 0.75,
          color: ThemeColors.recentActivities['income'],
          minHeight: 10,
          borderRadius: BorderRadius.circular(5),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 16,
            bottom: 8,
          ),
          child: ContentDivisionComponent(),
        ),
        const Text(
            'This month you spend R\$ 880.90 with games... Try reduce this spent!'),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Tell me how!',
              style: TextStyle(
                color: ThemeColors.recentActivities['income'],
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
