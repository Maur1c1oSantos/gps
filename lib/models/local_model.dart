class LocalModel {
  int id;
  String latitude;
  String longitude;
  String cidade;
  String rua;
  String cep;

  LocalModel(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.cidade,
      required this.rua,
      required this.cep});

  LocalModel.fromMap(Map<String, dynamic> local)
      : id = local['id'],
        latitude = local['latitude'],
        longitude = local['longitude'],
        cidade = local['cidade'],
        rua = local['rua'],
        cep = local['cep'];

  Map<String, Object> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'cidade': cidade,
      'rua': rua,
      'cep': cep,
    };
  }
}
