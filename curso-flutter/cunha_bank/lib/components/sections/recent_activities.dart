import 'package:cunha_bank/components/box_card_component.dart';
import 'package:flutter/material.dart';

class RecentActivities extends StatelessWidget {
  const RecentActivities({super.key});

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
      children: [
        
      ],
    );
  }
}
