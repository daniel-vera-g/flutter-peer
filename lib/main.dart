import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'screens/home.dart';
import 'screens/login/login-screen.dart';

main() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();

  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => user == null ? Login() : HomeScreen(),
    '/home': (BuildContext context) => HomeScreen(),
    '/login': (BuildContext context) => Login()
  };

  runApp(StreamProvider<FirebaseUser>.value(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      initialData: user,
      child: MaterialApp(
        /*     theme: ThemeData(accentColor: Colors.green),
        darkTheme: ThemeData.dark(), */
        title: "Find peers",
        routes: routes,
      )));
}
