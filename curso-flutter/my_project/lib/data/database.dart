import 'package:my_project/data/task_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');

  return openDatabase(
    path,
    onCreate: (db, version) => db.execute(TaskRepository.createTable()),
    version: 1,
  );
}
