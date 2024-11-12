import 'package:flutter/material.dart';
import 'package:my_project/components/task_component.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> tasks = [
    Task(
      taskName: 'Remember Basis of Flutter',
      imagePath: 'assets/images/dash-search.png',
      difficulty: 3,
    ),
    Task(
      taskName: 'Learn State Managment in Flutter',
      imagePath: 'assets/images/dash-search.png',
      difficulty: 5,
    ),
    Task(
      taskName: 'Learn Animations in Flutter',
      imagePath: 'assets/images/dash-search.png',
      difficulty: 1,
    ),
  ];

  void newTask(String name, int difficulty, String imageUrl) {
    tasks.add(
      Task(taskName: name, imagePath: imageUrl, difficulty: difficulty),
    );

     print(tasks.length);
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.tasks.length != tasks.length;
  }
}
