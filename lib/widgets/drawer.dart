import 'package:flutter/material.dart';
import 'package:sedil/screens/dictionary_screen.dart';
import 'package:sedil/screens/listening_screen.dart';
import 'package:sedil/screens/reading_screen.dart';
import 'package:sedil/utilities/lortime.dart';

class SedilDrawer extends StatefulWidget {
  @override
  State<SedilDrawer> createState() => _SedilDrawerState();
}

class _SedilDrawerState extends State<SedilDrawer> {
  int color = 0xff2196f3;

  @override
  Widget build(BuildContext context) {
    Widget drawer = Drawer(
      backgroundColor: Color(0xff2196f3),
      child: Container(
        child: ListView(
          children: [
            Container(
              height: 60,
              color: Color(0xff2196f3),
              child: DrawerHeader(
                child: ListenOrReadTimeWidget(),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Reading()));
                },
                title: Text(
                  "Okuma",
                  style: TextStyle(fontSize: 25, color: Color(color)),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Listening()));
                },
                title: Text(
                  "Dinleme",
                  style: TextStyle(fontSize: 25, color: Color(color)),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dictionary()));
                },
                title: Text(
                  "Sözlük",
                  style: TextStyle(fontSize: 25, color: Color(color)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return drawer;
  }
}
