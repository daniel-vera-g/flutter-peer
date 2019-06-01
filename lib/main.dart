import 'package:flutter/material.dart';
import 'package:flutterpeer/screens/login/login-screen.dart';

main() {
  final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => new Login()
  };

  runApp(MaterialApp(
    title: "Find peers",
    routes: routes,
    home: new Login(),
  ));
}
