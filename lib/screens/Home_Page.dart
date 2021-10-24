import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:parcial_1/helpers/constants.dart';
import 'package:http/http.dart' as http;
import 'package:parcial_1/models/ligas.dart';
import 'package:parcial_1/models/ligas_data.dart';
import 'package:parcial_1/screens/Lista_De_Ligas.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _showLogo(),
          _showSearchButton(),
        ],
      )),
    );
  }

  Widget _showLogo() {
    return Image(
      image: AssetImage('assets/logo.png'),
      width: 300,
    );
  }

  Widget _showSearchButton() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text("Buscar Ligas"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return Color(0xFF170B8F);
                }),
              ),
              onPressed: () => _search(),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              child: Text("Salir"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return Color(0xFFFFA200);
                }),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  void _search() async {
    var url = Uri.parse('${Constans.apiUrl}');
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );

    if (response.statusCode >= 400) {
      setState(() {
        _error = "error consultando el appi";
      });
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

    var responseBody = response.body;
    var decodeJson = jsonDecode(responseBody);
    var ligas = Ligas.fromJson(decodeJson);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Lista_De_Ligas(
                  ligas: ligas,
                )));
  }
}
