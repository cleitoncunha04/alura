// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FloorDatasource? _floorDatasourceInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FloorEntryModel` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `image` TEXT NOT NULL, `description` TEXT NOT NULL, `commonLocactions` TEXT NOT NULL, `category` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FloorDatasource get floorDatasource {
    return _floorDatasourceInstance ??=
        _$FloorDatasource(database, changeListener);
  }
}

class _$FloorDatasource extends FloorDatasource {
  _$FloorDatasource(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _floorEntryModelInsertionAdapter = InsertionAdapter(
            database,
            'FloorEntryModel',
            (FloorEntryModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'description': item.description,
                  'commonLocactions': item.commonLocactions,
                  'category': item.category
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorEntryModel> _floorEntryModelInsertionAdapter;

  @override
  Future<void> deleteEntryModel(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM FloorEntryModel WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Stream<List<FloorEntryModel?>> getAllAddedEntriesModel() {
    return _queryAdapter.queryListStream('SELECT * FROM FloorEntryModel',
        mapper: (Map<String, Object?> row) => FloorEntryModel(
            id: row['id'] as int,
            name: row['name'] as String,
            image: row['image'] as String,
            description: row['description'] as String,
            commonLocactions: row['commonLocactions'] as String,
            category: row['category'] as String),
        queryableName: 'FloorEntryModel',
        isView: false);
  }

  @override
  Future<void> saveEntryModel(FloorEntryModel entry) async {
    await _floorEntryModelInsertionAdapter.insert(
        entry, OnConflictStrategy.replace);
  }
}
