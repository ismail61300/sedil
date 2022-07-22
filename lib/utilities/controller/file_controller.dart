/*import 'package:flutter/material.dart';
import 'package:sedil/utilities/changing_listen_time.dart';

class FileController extends ChangeNotifier{
  late String _text;
  String get text => _text;
  readText() async {
    _text = await FileManager().readTextFile();
    notifyListeners();
  }
  writeText() async {
    _text = await FileManager().writeTextFile();
    notifyListeners();
  }
}*/