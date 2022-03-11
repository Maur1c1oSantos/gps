// ignore_for_file: file_names, library_prefixes, avoid_print, non_constant_identifier_names, no_logic_in_create_state

import 'dart:async';

import 'package:app_gps/constants.dart';
import 'package:app_gps/db/database.dart';
import 'package:app_gps/entitys/local_entity.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as Geocoding;
import 'package:location/location.dart';
import 'package:sizer/sizer.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key, required this.db}) : super(key: key);
  final AppDatabase db;

  @override
  State<BodyHome> createState() => _BodyState(db);
}

class _BodyState extends State<BodyHome> {
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? _userLocation;
  late String? address;
  late bool clicado;
  late LocalEntity local;
  final AppDatabase db;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    clicado = false;
  }

  Future<void> _getUserLocation() async {
    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

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

    setState(
      () {
        _userLocation = _locationData;
        lat = _userLocation!.latitude;
        lng = _userLocation!.longitude;
        places = Geocoding.placemarkFromCoordinates(lat!, lng!,
            localeIdentifier: "pt_BR");
        places.then(
          (value) {
            Geocoding.Placemark place = value[0];
            address = place.street;
            // db.localRepositoryDao.insertItem(
            //   LocalEntity(
            //       createdAt: DateTime.now().toUtc().toString(),
            //       latitude: lat,
            //       longitude: lng,
            //       pais: place.country,
            //       estado: place.locality,
            //       cidade: place.subLocality,
            //       rua: place.street,
            //       cep: place.postalCode),
            // );
            print(_locationData.accuracy);
          },
        );
      },
    );
  }

  _ButtomClick() {
    clicado == false ? clicado = true : clicado = false;
    _pegaPosicao();
  }

  _pegaPosicao() {
    Timer(
      const Duration(seconds: 30),
      () => [
        if (clicado == true) {_getUserLocation(), _pegaPosicao()}
      ],
    );
  }

  _BodyState(this.db);
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
                            child: Container(),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: EdgeInsets.all(5.h),
                              primary: clicado == false
                                  ? const Color.fromRGBO(69, 165, 39, 1)
                                  : const Color.fromRGBO(194, 42, 42, 1),
                              onPrimary: Colors.red,
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
