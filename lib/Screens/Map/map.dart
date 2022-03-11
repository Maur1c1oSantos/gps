import 'package:app_gps/Screens/Map/components/bodyMap.dart';
import 'package:app_gps/constants.dart';
import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);
  static String routeName = "/map";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: const Text(
          'GPS',
          style: TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const BodyMap(),
    );
  }
}
