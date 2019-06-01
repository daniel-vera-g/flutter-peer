import 'package:flutter/material.dart';
import 'package:flutterpeer/screens/discover.dart';
import 'package:flutterpeer/screens/home_page.dart';
import 'package:flutterpeer/screens/profile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   appBar: AppBar(
        title: Text("Flutter Peer"),
      ), */
      // body: Row(
      //  children: <Widget>[

      //  ],
      // )
      body: index == 0
          ? DiscoverPage()
          : index == 1 ? OverviewPage() : ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(MdiIcons.compass), title: new Text("Discover")),
          BottomNavigationBarItem(
              icon: new Icon(MdiIcons.home), title: new Text("Home")),
          BottomNavigationBarItem(
              icon: new Icon(MdiIcons.account), title: new Text("Account")),
        ],
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
      ),
      /*   floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ), */
    );
  }
}
