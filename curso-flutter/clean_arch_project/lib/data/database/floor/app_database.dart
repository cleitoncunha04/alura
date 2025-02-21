import 'dart:async';
import 'package:clean_arch_project/data/database/floor/floor_datasource.dart';
import 'package:clean_arch_project/data/database/floor/model/floor_entry_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [FloorEntryModel])
abstract class AppDatabase extends FloorDatabase {
  FloorDatasource get floorDatasource;

  static Future<AppDatabase> createDatabase() async {
    return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}
