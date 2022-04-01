// ignore_for_file: file_names

import 'package:app_gps/db/database.dart';
import 'package:app_gps/models/local_entity.dart';

class LocalController {
  final db = DatabaseHandler();

  Future<void> salvarLocal(LocalEntity local) async {
    await db.insertLocal(local);
  }

  Future<void> deletarLocal(int id) async {
    await db.deleteLocal(id);
  }

  Future<List<LocalEntity>> listarLocais() async {
    return await db.listarLocais();
  }
}
