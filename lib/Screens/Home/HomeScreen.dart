// ignore_for_file: file_names, sized_box_for_whitespace
import 'package:app_gps/Screens/Home/Components/bodyHome.dart';
import 'package:app_gps/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

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
      body: const BodyHome(),
    );
  }
}
