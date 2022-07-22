import 'package:flutter/material.dart';
import 'package:sedil/widgets/lortappbar.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profilim"),
      ),
      body: CustomScrollView(
          slivers: <Widget>[
            LORTAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                
              ]),
            ),
          ],
        ),
    );
  }
}
