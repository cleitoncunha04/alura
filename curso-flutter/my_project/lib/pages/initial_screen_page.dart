import 'package:flutter/material.dart';
import 'package:my_project/components/task_component.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.home,
          size: 24,
          color: Colors.white,
        ),
        title: const Text(
          'Tasks list',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          children: const [
            Task(
              taskName: 'Remember Basis of Flutter',
              imagePath:
                  'assets/images/dash-search.png',
              difficulty: 3,
            ),
            Task(
              taskName: 'Learn State Managment in Flutter',
              imagePath:
                  'assets/images/dash-search.png',
              difficulty: 5,
            ),
            Task(
              taskName: 'Learn Animations in Flutter',
              imagePath:
                  'assets/images/dash-search.png',
              difficulty: 1,
            ),
            SizedBox(height: 80,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            setState(() => (opacity == 1) ? opacity = 0 : opacity = 1),
        backgroundColor: Colors.black,
        child: Icon(
          (opacity == 1) ? Icons.visibility : Icons.visibility_off,
          color: Colors.white,
        ),
      ),
    );
  }
}
