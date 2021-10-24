import 'package:flutter/material.dart';
import 'package:parcial_1/screens/Home_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Soccer App',
        home: HomePage());
  }
}
