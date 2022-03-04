class LocalModel {
  int id;
  String latitude;
  String longitude;
  String pais;
  String estado;
  String cidade;
  String rua;
  String cep;

  LocalModel(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.pais,
      required this.estado,
      required this.cidade,
      required this.rua,
      required this.cep});

  LocalModel.fromMap(Map<String, dynamic> local)
      : id = local['id'],
        latitude = local['latitude'],
        longitude = local['longitude'],
        pais = local['pais'],
        estado = local['estado'],
        cidade = local['cidade'],
        rua = local['rua'],
        cep = local['cep'];

  Map<String, Object> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'pais': pais,
      'estado': estado,
      'cidade': cidade,
      'rua': rua,
      'cep': cep,
    };
  }
}
