import 'package:flutter/material.dart';

import './screens/home.dart';
import './screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(navigatorKey),
      routes: {
        Home.routeName: (ctx) => Home(navigatorKey),
        Login.routeName: (ctx) => Login(navigatorKey)
      },
      navigatorKey: navigatorKey,
    );
  }
}
