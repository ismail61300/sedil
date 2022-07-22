import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sedil/widgets/lortappbar.dart';

class Reading extends StatefulWidget {
  @override
  _ReadingState createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  String data = "";

  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString("contents/dilProjesi.txt");

    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("300 Kere Okuma"),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            LORTAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 2.5),
                  child: Image(
                    image: AssetImage("images/300_kere_okuma.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          data,
                          style:
                              TextStyle(fontSize: 20,),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
