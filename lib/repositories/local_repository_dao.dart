import 'package:floor/floor.dart';
import '../entitys/local_entity.dart';
import 'interface/repository.dao.interface.dart';

@dao
abstract class LocalRepositoryDao extends IRepositoryDaoInterface<LocalEntity> {
  @Query('SELECT * FROM Todos WHERE id = :id')
  Future<LocalEntity?> getById(int id);

  @Query('SELECT * FROM Todos')
  Future<List<LocalEntity?>> getAll();
}
