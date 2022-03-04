// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
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

  LocalRepositoryDao? _localRepositoryDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `Local` (`latitude` TEXT NOT NULL, `longitude` TEXT NOT NULL, `pais` TEXT NOT NULL, `estado` TEXT NOT NULL, `cidade` TEXT NOT NULL, `rua` TEXT NOT NULL, `cep` TEXT NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `createdAt` TEXT NOT NULL, `updateAt` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LocalRepositoryDao get localRepositoryDao {
    return _localRepositoryDaoInstance ??=
        _$LocalRepositoryDao(database, changeListener);
  }
}

class _$LocalRepositoryDao extends LocalRepositoryDao {
  _$LocalRepositoryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _localEntityInsertionAdapter = InsertionAdapter(
            database,
            'Local',
            (LocalEntity item) => <String, Object?>{
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'pais': item.pais,
                  'estado': item.estado,
                  'cidade': item.cidade,
                  'rua': item.rua,
                  'cep': item.cep,
                  'id': item.id,
                  'createdAt': item.createdAt,
                  'updateAt': item.updateAt
                }),
        _localEntityUpdateAdapter = UpdateAdapter(
            database,
            'Local',
            ['id'],
            (LocalEntity item) => <String, Object?>{
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'pais': item.pais,
                  'estado': item.estado,
                  'cidade': item.cidade,
                  'rua': item.rua,
                  'cep': item.cep,
                  'id': item.id,
                  'createdAt': item.createdAt,
                  'updateAt': item.updateAt
                }),
        _localEntityDeletionAdapter = DeletionAdapter(
            database,
            'Local',
            ['id'],
            (LocalEntity item) => <String, Object?>{
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'pais': item.pais,
                  'estado': item.estado,
                  'cidade': item.cidade,
                  'rua': item.rua,
                  'cep': item.cep,
                  'id': item.id,
                  'createdAt': item.createdAt,
                  'updateAt': item.updateAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LocalEntity> _localEntityInsertionAdapter;

  final UpdateAdapter<LocalEntity> _localEntityUpdateAdapter;

  final DeletionAdapter<LocalEntity> _localEntityDeletionAdapter;

  @override
  Future<LocalEntity?> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM Todos WHERE id = ?1',
        mapper: (Map<String, Object?> row) => LocalEntity(
            row['id'] as int,
            row['createdAt'] as String,
            row['updateAt'] as String,
            row['latitude'] as String,
            row['longitude'] as String,
            row['pais'] as String,
            row['estado'] as String,
            row['cidade'] as String,
            row['rua'] as String,
            row['cep'] as String),
        arguments: [id]);
  }

  @override
  Future<List<LocalEntity?>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Todos',
        mapper: (Map<String, Object?> row) => LocalEntity(
            row['id'] as int,
            row['createdAt'] as String,
            row['updateAt'] as String,
            row['latitude'] as String,
            row['longitude'] as String,
            row['pais'] as String,
            row['estado'] as String,
            row['cidade'] as String,
            row['rua'] as String,
            row['cep'] as String));
  }

  @override
  Future<int> insertItem(LocalEntity item) {
    return _localEntityInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(LocalEntity item) {
    return _localEntityUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(LocalEntity item) {
    return _localEntityDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
