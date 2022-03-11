import 'package:app_gps/Screens/Home/home.dart';
import 'package:app_gps/Screens/Map/map.dart';
import 'package:app_gps/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Screens/Components/bottom_nav_bar.dart';
import 'db/database.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key, required this.db}) : super(key: key);
  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GPS',
          theme: theme(),
          initialRoute: BottomNavBar.routeName,
          routes: {
            BottomNavBar.routeName: (context) => BottomNavBar(db: db),
            Home.routeName: (context) => Home(db: db),
            Map.routeName: (context) => const Map(),
          },
        );
      },
    );
  }
}
