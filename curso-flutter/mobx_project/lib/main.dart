import 'package:flutter/material.dart';
import 'package:mobx_project/screens/home_screen.dart';
import 'package:mobx_project/store/cart_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(PanucciDelivery());
}

class PanucciDelivery extends StatelessWidget {
  const PanucciDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 83, 83),
        ),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          Provider(
            create: (_) => CartStore(),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
