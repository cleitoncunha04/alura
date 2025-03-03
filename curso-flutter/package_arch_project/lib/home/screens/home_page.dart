import 'package:bytebank_balance/bytebank_balance.dart';
import 'package:flutter/material.dart';
import 'package:package_arch_project/_core/constants/bytebank_colors.dart';
import 'package:package_arch_project/_core/constants/bytebank_screens.dart';
import 'package:package_arch_project/_core/widgets/appbar_widget.dart';
import 'package:package_arch_project/_core/widgets/drawer_widget.dart';
import 'package:package_arch_project/home/widgets/home_background_widget.dart';
import 'package:package_arch_project/home/widgets/home_title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(),
      drawer: getDrawerWidget(
        context: context,
        screen: BytebankScreens.home,
      ),
      body: const HomeBackgroundWidget(
        children: [
          HomeTitleWidget(),
          BytebankBalance(
            userId: "ID001",
            color: BytebankColors.white,
          ),
        ],
      ),
    );
  }
}
