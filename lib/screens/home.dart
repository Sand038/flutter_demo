import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/login.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  final GlobalKey<NavigatorState> _navigatorKey;

  Home(this._navigatorKey);

  logout() {
    Navigator.of(_navigatorKey.currentContext!)
        .pushReplacementNamed(Login.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final userAttributes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final userId = userAttributes["userId"]!;

    var statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Welcome to Flutter Demo"),
        actions: <Widget>[
          IconButton(
            onPressed: () => logout(),
            icon: Icon(Icons.logout, color: Colors.white, size: 30),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            new ElevatedButton(
              child: new Text(
                "Online Registration",
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 100),
              ),
              onPressed: () {},
            ),
            Expanded(
              child: Container(),
            ),
            new ElevatedButton(
              child: new Text(
                "Update Details",
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 100),
              ),
              onPressed: () {},
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
