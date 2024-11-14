import 'package:flutter/material.dart';
import 'package:my_project/components/task_component.dart';
import 'package:my_project/data/task_repository.dart';
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
        title: const Text(
          'Tasks list',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contextNew) => FormScreen(taskContext: context),
                ),
              ).then((value) async {
                if (value == true) {
                  await TaskRepository().findAll();

                  setState(() {});
                }
              });
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 70,
          ),
          child: FutureBuilder(
              future: TaskRepository().findAll(),
              builder: (context, snapshot) {
                List<Task>? tasks = snapshot.data;

                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasData && tasks != null) {
                      if (tasks.isNotEmpty) {
                        return ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (BuildContext context, index) {
                              return tasks[index];
                            });
                      } else {
                        return const Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 128,
                              ),
                              Text(
                                'Tasks list is empty...',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    } else {
                      return const Text('Error on loading tasks...');
                    }

                  default:
                    return const Text('Unknown error...');
                }
              }),
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
