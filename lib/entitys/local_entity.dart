import 'package:app_gps/entitys/entity_base.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'Local')
class LocalEntity extends EntityBase {
  LocalEntity(int id, String createdAt, String updateAt, this.latitude,
      this.longitude, this.pais, this.estado, this.cidade, this.rua, this.cep)
      : super(id, createdAt, updateAt);

  final String latitude;
  final String longitude;
  final String pais;
  final String estado;
  final String cidade;
  final String rua;
  final String cep;
}
