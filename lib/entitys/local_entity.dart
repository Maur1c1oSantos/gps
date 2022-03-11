import 'package:app_gps/entitys/entity_base.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'Locais')
class LocalEntity extends EntityBase {
  LocalEntity(
      {int? id,
      required String createdAt,
      String? updateAt,
      required this.latitude,
      required this.longitude,
      required this.pais,
      required this.estado,
      required this.cidade,
      required this.rua,
      required this.cep})
      : super(id, createdAt, updateAt);

  final double? latitude;
  final double? longitude;
  final String? pais;
  final String? estado;
  final String? cidade;
  final String? rua;
  final String? cep;
}
