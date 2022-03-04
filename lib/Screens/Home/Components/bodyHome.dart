// ignore_for_file: file_names, no_logic_in_create_state

import 'package:app_gps/constants.dart';
import 'package:app_gps/db/database.dart';
import 'package:app_gps/entitys/local_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Components/bottom_nav_bar.dart';
import '../../Components/default_botton.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key, required this.db, this.local}) : super(key: key);
  final AppDatabase db;
  final LocalEntity? local;

  @override
  State<BodyHome> createState() => _BodyState(db, local);
}

class _BodyState extends State<BodyHome> {
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
                    DefaultButton(
                      text: "Iniciar",
                      press: () {
                        db.localRepositoryDao.insertItem(
                          LocalEntity(
                              1,
                              DateTime.now().toUtc().toString(),
                              DateTime.now().toUtc().toString(),
                              latitude,
                              longitude,
                              cidade,
                              rua,
                              cep),
                        );
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
