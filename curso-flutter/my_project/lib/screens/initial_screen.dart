import 'package:flutter/material.dart';
import 'package:my_project/components/task_component.dart';
import 'package:my_project/data/task_inherited.dart';
import 'package:my_project/screens/form_screen.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tasks list',
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) =>  FormScreen(taskContext: context),
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70,), 
          children: TaskInherited.of(context)!.tasks,
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
