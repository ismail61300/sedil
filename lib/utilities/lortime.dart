import 'dart:convert';
import 'package:flutter/material.dart';

class ListenOrReadTimeWidget extends StatefulWidget {
  @override
  State<ListenOrReadTimeWidget> createState() => _ListenOrReadTimeWidgetState();
}
class _ListenOrReadTimeWidgetState extends State<ListenOrReadTimeWidget> {
  List data = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("lib/utilities/lortime.json"),
          builder: (context, snapshot) {
            var mydata = jsonDecode(snapshot.data.toString());
            return StreamBuilder<Object>(
              stream: null,
              builder: (BuildContext context, snapshot) {
                return Text(
                  mydata["lrTime"] + " Kere " + mydata["lrType"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }
            );
          },
        ),
      ),
    );
  }
}
