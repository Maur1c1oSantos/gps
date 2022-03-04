import '../entitys/local_entity.dart';

class RotaModel {
  int id;
  List<LocalEntity> rota;

  RotaModel({
    required this.id,
    required this.rota,
  });

  RotaModel.fromMap(Map<String, dynamic> local)
      : id = local['id'],
        rota = local['rota'];

  Map<String, Object> toMap() {
    return {
      'id': id,
      'rota': rota,
    };
  }
}
