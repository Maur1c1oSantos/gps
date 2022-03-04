import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../entitys/local_entity.dart';
import '../repositories/local_repository_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [LocalEntity])
abstract class AppDatabase extends FloorDatabase {
  LocalRepositoryDao get localRepositoryDao;
}
