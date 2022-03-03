import 'package:app_gps/Screens/Home/HomeScreen.dart';
import 'package:app_gps/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Screens/Components/bottom_nav_bar.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rotas GPS',
          theme: theme(),
          initialRoute: BottomNavBar.routeName,
          routes: {
            BottomNavBar.routeName: (context) => const BottomNavBar(),
            HomeScreen.routeName: (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
