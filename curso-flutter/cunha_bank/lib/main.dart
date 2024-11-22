import 'package:cunha_bank/screens/home_screen.dart';
import 'package:cunha_bank/themes/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CunhaBank());
}

class CunhaBank extends StatelessWidget {
  const CunhaBank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cunha Bank',
      theme: myTheme,
      home: const HomeScreen(),
    );
  }
}
