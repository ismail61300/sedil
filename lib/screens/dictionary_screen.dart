import 'package:flutter/material.dart';

class Dictionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sözlük"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Google Formu Nasıl Doldurulur?",
                    style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
