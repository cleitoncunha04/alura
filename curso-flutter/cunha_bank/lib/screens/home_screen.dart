import 'package:cunha_bank/components/sections/account_actions_section.dart';
import 'package:cunha_bank/components/sections/account_points_section.dart';
import 'package:cunha_bank/components/sections/header_section.dart';
import 'package:cunha_bank/components/sections/recent_activities_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderSection(),
            RecentActivitiesSection(),
            AccountActionsSection(),
            AccountPointsSection(),
          ],
        ),
      ),
    );
  }
}
