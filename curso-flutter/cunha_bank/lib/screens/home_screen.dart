import 'package:cunha_bank/components/sections/header_section.dart';
import 'package:cunha_bank/components/sections/recent_activities.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: <Widget>[
          HeaderSection(),
          RecentActivities(),
        ],
      ),
    );
  }
}
