import 'package:floor/floor.dart';

class EntityBase {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String createdAt;
  final String? updateAt;

  EntityBase(this.id, this.createdAt, this.updateAt);
}
