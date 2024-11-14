import 'package:my_project/components/task_component.dart';
import 'package:my_project/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepository {
  static const String _tableName = 'tasks';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  
  static String createTable() {
    return 'CREATE TABLE IF NOT EXISTS $_tableName ('
        '$_name TEXT, '
        '$_difficulty INTEGER, '
        '$_image TEXT)';
  }

  List<Task> mapToList(List<Map<String, dynamic>> tasksMap) {
    final List<Task> tasks = [];

    for (Map<String, dynamic> row in tasksMap) {
      final Task task = Task(
        taskName: row[_name],
        imagePath: row[_image],
        difficulty: row[_difficulty],
      );

      tasks.add(task);
    }

    return tasks;
  }

  Map<String, dynamic> taskToMap(Task task) {
    return {
      _name: task.taskName,
      _image: task.imagePath,
      _difficulty: task.difficulty,
    };
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();

    final List<Map<String, dynamic>> tasksMap = await db.query(_tableName);

    return mapToList(tasksMap);
  }

  Future<List<Task>> findByName(String name) async {
    final Database db = await getDatabase();

    final List<Map<String, dynamic>> tasksMap =
        await db.query(_tableName, where: '$_name = ?', whereArgs: [_name]);

    return mapToList(tasksMap);
  }

  Future<int> save(Task task) async {
    final Database db = await getDatabase();

    List<Task> itemExists = await findByName(task.taskName);

    if (itemExists.isEmpty) {
      return await db.insert(
        _tableName,
        taskToMap(task),
      );
    } else {
      return await db.update(
        _tableName,
        taskToMap(task),
        where: '$_name = ?',
        whereArgs: [task.taskName],
      );
    }
  }

  Future<int> remove(String name) async {
    final Database db = await getDatabase();

    print('Deleting task');

    return await db.delete(
      _tableName,
      where: 'name = ?',
      whereArgs: [name],
    );
  }
}
