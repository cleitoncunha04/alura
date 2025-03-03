import 'package:bytebank_balance/bytebank_balance.dart';
import 'package:flutter/material.dart';
import 'package:package_arch_project/_core/constants/bytebank_routes.dart';
import 'package:package_arch_project/_core/decorations/bytebank_theme_data.dart';
import 'package:package_arch_project/home/screens/home_page.dart';
import 'package:package_arch_project/statement/screens/statement_page.dart';
import 'package:package_arch_project/transfers/screens/transfers_page.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', '');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getBytebankThemeData(),
      initialRoute: BytebankRoutes.home,
      routes: {
        BytebankRoutes.home: (context) => const HomePage(),
        BytebankRoutes.transfers: (context) => const TransfersPage(),
        BytebankRoutes.statement: (context) => const StatementPage(),
      },
    );
  }

  test() {
    Calculator();
  }
}
