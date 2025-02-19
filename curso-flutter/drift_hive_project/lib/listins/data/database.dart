import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_listin/listins/models/listin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

class ListinTable extends Table {
  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get name => text().named('name').withLength(min: 4, max: 30)();
  TextColumn get obs => text().named('obs')();
  DateTimeColumn get dateCreate => dateTime().named('dateCreate')();
  DateTimeColumn get dateUpdate => dateTime().named('dateUpdate')();
}

@DriftDatabase(tables: [
  ListinTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> add(Listin listin) async {
    ListinTableCompanion newRow = ListinTableCompanion(
      name: Value(listin.name),
      obs: Value(listin.obs),
      dateCreate: Value(listin.dateCreate),
      dateUpdate: Value(listin.dateUpdate),
    );

    return await into(listinTable).insert(newRow);
  }

  Future<List<Listin>> findAll({String? orderBy}) async {
    List<ListinTableData> data = [];

    if (orderBy != null) {
      if (orderBy == 'name') {
        return await _findAllOrderedByName();
      } else if (orderBy == 'updateDate') {
        return await _findAllOrderedByUpdateDate();
      } else if (orderBy == 'createDate') {
        data = await select(listinTable).get();
      }
    } else {
      data = await select(listinTable).get();
    }

    return data
        .map(
          (row) => Listin(
            id: row.id.toString(),
            name: row.name,
            obs: row.obs,
            dateCreate: row.dateCreate,
            dateUpdate: row.dateUpdate,
          ),
        )
        .toList();
  }

  Future<List<Listin>> _findAllOrderedByName() async {
    List<ListinTableData> data = await (select(listinTable)
          ..orderBy([(listin) => OrderingTerm(expression: listin.name)]))
        .get();

    return data
        .map(
          (row) => Listin(
            id: row.id.toString(),
            name: row.name,
            obs: row.obs,
            dateCreate: row.dateCreate,
            dateUpdate: row.dateUpdate,
          ),
        )
        .toList();
  }

  Future<List<Listin>> _findAllOrderedByUpdateDate() async {
    List<ListinTableData> data = await (select(listinTable)
          ..orderBy([(listin) => OrderingTerm.desc(listin.dateUpdate)]))
        .get();

    return data
        .map(
          (row) => Listin(
            id: row.id.toString(),
            name: row.name,
            obs: row.obs,
            dateCreate: row.dateCreate,
            dateUpdate: row.dateUpdate,
          ),
        )
        .toList();
  }

  Future<bool> updateListin(Listin listin) async {
    return await update(listinTable).replace(ListinTableCompanion(
      id: Value(
        int.parse(listin.id),
      ),
      name: Value(listin.name),
      obs: Value(listin.obs),
      dateCreate: Value(listin.dateCreate),
      dateUpdate: Value(listin.dateUpdate),
    ));
  }

  Future<int> remove(int id) async {
    return await (delete(listinTable)..where((row) => row.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final Directory dbFolder = await getApplicationDocumentsDirectory();

      final File file = File(path.join(dbFolder.path, "db.sqlite"));

      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      return NativeDatabase.createInBackground(file);
    },
  );
}
