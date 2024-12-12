import 'package:flutter/material.dart';
import 'package:tests_project/data/bank_http.dart';
import 'package:tests_project/data/bank_inherited.dart';
import 'package:tests_project/screens/home.dart';
import 'package:tests_project/themes/purple_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: purpleTheme,
      home: BankInherited(
        child: Home(
          api: BankHttp().dolarToReal(),
        ),
      ),
    );
  }
}
