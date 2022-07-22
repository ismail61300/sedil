import 'package:flutter/material.dart';
import 'package:sedil/screens/profile.dart';

class SedilAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Sedil Dil Öğrenme",
        style: TextStyle(fontSize: 20),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profile()));
            },
            icon: Icon(Icons.account_circle, color: Colors.white)),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
