import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.blueAccent,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.amberAccent,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.amberAccent,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.blueAccent,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(color: Colors.cyan, width: 50, height: 50),
              Container(color: Colors.pinkAccent, width: 50, height: 50),
              Container(color: Colors.purpleAccent, width: 50, height: 50),
            ],
          ),
          Container(
            color: Colors.brown,
            height: 30,
            width: 300,
            child: const Text(
              'Coxinha',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 26,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Press here...')),
        ],
      ),
    );
  }
}
