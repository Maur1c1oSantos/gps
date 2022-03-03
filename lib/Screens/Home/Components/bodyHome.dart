// ignore_for_file: file_names

import 'package:app_gps/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Components/bottom_nav_bar.dart';
import '../../Components/default_botton.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyState();
}

class _BodyState extends State<BodyHome> {
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
                    DefaultButton(
                      text: "Iniciar",
                      press: () {
                        Navigator.pushReplacementNamed(
                            context, BottomNavBar.routeName);
                      },
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
