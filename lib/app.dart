import 'package:flutter/material.dart';
import 'package:parcial_1/counter.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Counter(),
      ),
    );
  }
}
