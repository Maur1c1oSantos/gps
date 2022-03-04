// ignore_for_file: file_names, library_prefixes, avoid_print, non_constant_identifier_names

import 'package:app_gps/constants.dart';
import 'package:app_gps/db/database.dart';
import 'package:app_gps/entitys/local_entity.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as Geocoding;
import 'package:location/location.dart';
import 'package:sizer/sizer.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key, required this.db, this.local}) : super(key: key);
  final AppDatabase db;
  final LocalEntity? local;

  @override
  State<BodyHome> createState() => _BodyState(db, local);
}

class _BodyState extends State<BodyHome> {
  late bool clicado = false;
  late bool _serviceEnabled; //verificar o GPS (on/off)
  late PermissionStatus _permissionGranted; //verificar a permissão de acesso
  LocationData? _userLocation;
  late String? address;

  Future<void> _getUserLocation() async {
    Location location = Location();

    //1. verificar se o serviço de localização está ativado
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    //2. solicitar a permissão para o app acessar a localização
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final _locationData = await location.getLocation();

    Future<List<Geocoding.Placemark>> places;
    double? lat;
    double? lng;
    setState(() {
      _userLocation = _locationData;
      lat = _userLocation!.latitude;
      lng = _userLocation!.longitude;
      places = Geocoding.placemarkFromCoordinates(lat!, lng!,
          localeIdentifier: "pt_BR");
      places.then((value) {
        Geocoding.Placemark place = value[0];
        address = place.street; //nome da rua
        print(_locationData.accuracy); //acurácia da localização
      });
    });
  }

  _ButtomClick() {
    if (clicado == false) {
      clicado = true;
    } else {
      clicado = false;
    }
  }

  final AppDatabase db;
  final LocalEntity? local;
  _BodyState(this.db, this.local);

  var latitude = '08644124';
  var longitude = '3606913';
  var pais = 'Brasil';
  var estado = 'Pernabuco';
  var cidade = 'Garanhuns';
  var rua = 'Rua numero 2';
  var cep = '55369050';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 80.h,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 1.h,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55.h,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.h),
                            side: BorderSide(
                              color: kPrimaryLightColor,
                              width: 0.5.w,
                            ),
                          ),
                          // color: Colors.black45,
                          child: InkWell(
                            splashColor: kPrimaryColor.withAlpha(30),
                            onTap: () {
                              debugPrint('Card tapped.');
                            },
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_userLocation != null)
                            Text(
                              'LAT: ${_userLocation!.latitude}, LNG: ${_userLocation!.longitude}'
                                      "\n" +
                                  address!,
                              textAlign: TextAlign.center,
                            ),
                          // DefaultButton(
                          //   text: "Iniciar",
                          //   press: () {
                          //     _getUserLocation,
                          //     Navigator.pushReplacementNamed(
                          //         context, BottomNavBar.routeName);
                          //   },
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: EdgeInsets.all(5.h),
                              primary: clicado == false
                                  ? const Color.fromRGBO(69, 165, 39, 1)
                                  : const Color.fromRGBO(
                                      194, 42, 42, 1), // <-- Button color
                              onPrimary: Colors.red, // <-- Splash color
                            ),
                            onPressed: () => [
                              _getUserLocation(),
                              _ButtomClick(),
                            ],
                            child: clicado == false
                                ? const Text(
                                    'Iniciar',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const Text(
                                    'Parar',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
