// ignore_for_file: file_names, must_be_immutable, no_logic_in_create_state, avoid_print

import 'package:app_gps/views/Components/default_app_bar.dart';
import 'package:app_gps/controllers/rotaController.dart';
import 'package:app_gps/models/rota_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Historico extends StatefulWidget {
  const Historico({Key? key}) : super(key: key);
  static String routeName = "/historico";

  @override
  State<Historico> createState() => _BodyState();
}

class _BodyState extends State<Historico> {
  RotaController rotaController = RotaController();
  _BodyState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: SizedBox(
        height: 80.h,
        child: FutureBuilder<List<RotaEntity>>(
          future: rotaController.listarRotas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("id: " +
                        snapshot.data![index].id.toString() +
                        " titulo: " +
                        snapshot.data![index].titulo +
                        " Tempo: " +
                        snapshot.data![index].tempo),
                    // subtitle: Text(snapshot.data![index].tempo),
                    // leading: const Icon(Icons.person),
                    onTap: () {
                      print('Clicou aqui');
                    },
                  );
                },
              );
            }
            return Container(
              alignment: AlignmentDirectional.center,
              child: const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
