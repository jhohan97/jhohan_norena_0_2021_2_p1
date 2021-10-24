import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:parcial_1/models/ligas.dart';
import 'package:parcial_1/models/ligas_data.dart';

class Lista_De_Ligas extends StatefulWidget {
  final Ligas ligas;

  Lista_De_Ligas({required this.ligas});

  @override
  _Lista_De_LigasState createState() => _Lista_De_LigasState();
}

class _Lista_De_LigasState extends State<Lista_De_Ligas> {
  @override
  void initState() {
    super.initState();
    _getLigas();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Ligas"),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Center(
        child: Text(
          'ligas ${widget.ligas.data[0].name}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<Null> _getLigas() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      await showAlertDialog(
          context: context,
          title: 'Error',
          message: 'Verifica que estes conectado a internet.',
          actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
          ]);
      return;
    }
  }
}
