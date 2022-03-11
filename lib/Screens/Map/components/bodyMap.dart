// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BodyMap extends StatefulWidget {
  const BodyMap({Key? key}) : super(key: key);

  @override
  State<BodyMap> createState() => _BodyMapState();
}

class _BodyMapState extends State<BodyMap> {
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-8.895732, -36.4940915),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: SizedBox(
            height: 82.h,
            // width: double.infinity,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialCameraPosition,
            ),
          ),
        ),
      ],
    );
    // GoogleMap(
    //   myLocationButtonEnabled: false,
    //   zoomControlsEnabled: false,
    //   initialCameraPosition: _initialCameraPosition,
    // ),
  }
}
