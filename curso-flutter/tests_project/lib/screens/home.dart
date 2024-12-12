import 'package:flutter/material.dart';
import 'package:tests_project/components/sections/actions.dart';
import 'package:tests_project/components/sections/header.dart';
import 'package:tests_project/components/sections/points_exchange.dart';
import 'package:tests_project/components/sections/recent_activities.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.api,
  });
  final Future<String> api;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(
              api: api,
            ), // cuidado com o const
            const RecentActivity(),
            const ActionsSection(),
            const PointsExchange(),
          ],
        ),
      ),
    );
  }
}
