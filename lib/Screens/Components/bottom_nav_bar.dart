// ignore_for_file: prefer_const_constructors

import 'package:app_gps/Screens/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import '../Home/HomeScreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  static String routeName = "/bottom_bar";

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int index = 0;
  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
    ];

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            color: kPrimaryLightColor,
            buttonBackgroundColor: kPrimaryColor,
            backgroundColor: Colors.transparent,
            key: _bottomNavigationKey,
            index: 1,
            height: 60.0,
            items: <Widget>[
              Icon(Icons.account_circle, size: 4.h),
              Icon(Icons.timeline, size: 4.h),
              Icon(Icons.list, size: 4.h),
            ],
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 500),
            onTap: (index) {
              setState(() {
                index = index;
              });
            },
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
