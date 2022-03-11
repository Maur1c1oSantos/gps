import 'package:app_gps/entitys/entity_base.dart';
import 'package:floor/floor.dart';

abstract class IRepositoryDaoInterface<T extends EntityBase> {
  @insert
  Future<int> insertItem(T item);

  @update
  Future<int> updateItem(T item);

  @delete
  Future<int> deleteItem(T item);
}
