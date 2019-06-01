import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/home.dart';
import 'screens/login/login-screen.dart';

main() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();

  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => user == null ? Login() : HomeScreen(),
    '/home': (BuildContext context) => HomeScreen(),
    '/login': (BuildContext context) => Login()
  };

  runApp(MaterialApp(
    title: "Find peers",
    routes: routes,
  ));
}
