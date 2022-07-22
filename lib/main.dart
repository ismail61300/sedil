import 'package:flutter/material.dart';
import 'package:sedil/screens/main_screen.dart';

void main() {
  runApp(SedilApp());
}

class SedilApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sedil",
      home: MainScreen(),
    );
  }
}