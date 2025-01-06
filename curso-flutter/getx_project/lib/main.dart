import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/screens/home_screen.dart';

void main() {
  runApp(const PanucciDelivery());
}

class PanucciDelivery extends StatelessWidget {
  const PanucciDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            primary: const Color.fromARGB(255, 173, 25, 14),
            seedColor: const Color.fromARGB(255, 255, 83, 83),
          ),
          useMaterial3: true),
      home: HomeScreen(),
    );
  }
}
