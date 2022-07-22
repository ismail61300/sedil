import 'package:flutter/material.dart';
import 'package:sedil/screens/listening_screen.dart';
import 'package:sedil/screens/reading_screen.dart';
import 'package:sedil/screens/dictionary_screen.dart';
import 'package:sedil/utilities/lortime.dart';
import 'package:sedil/widgets/appbar.dart';
import 'package:sedil/widgets/drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SedilAppBar(),
        drawer: SedilDrawer(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title:
                    ListenOrReadTimeWidget(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  alignment: Alignment.center,
                  child: Row(children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Listening()));
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 2.5),
                        child: Image(
                          image: AssetImage("images/300_kere_dinleme.png"),
                        ),
                      ),
                    )),
                  ]),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Reading()));
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                        child: Image(
                          image: AssetImage("images/300_kere_okuma.png"),
                        ),
                      ),
                    )),
                  ]),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dictionary()));
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                        child: Image(
                          image: AssetImage("images/sözlük.png"),
                        ),
                      ),
                    )),
                  ]),
                )
              ]),
            ),
          ],
        ));
  }
}
