import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find peers"),
      ),
      // body: Row(
      //  children: <Widget>[

      //  ], 
      // )
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(MdiIcons.home), title: new Text("Home")),
          BottomNavigationBarItem(
              icon: new Icon(MdiIcons.compass), title: new Text("Discover")),
          BottomNavigationBarItem(
              icon: new Icon(MdiIcons.account), title: new Text("Account")),
        ],
      ),
    );
  }
}
