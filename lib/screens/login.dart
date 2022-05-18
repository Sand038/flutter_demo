import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/screens/home.dart';
import 'package:flutter_demo/service/auth_service.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';

  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  final _passwordController = TextEditingController();
  late AuthService _authService;
  final GlobalKey<NavigatorState> _navigatorKey;

  Login(this._navigatorKey) {
    _authService = AuthService();
  }

  void _login(ctx) async {
    _formKey.currentState?.save();
    String? email = _authData['email'];
    String? password = _authData['password'];

    if (_authService.login(email, password)) {
      toHomeScreen();
    } else {
      _showErrorDialog('Incorrect username/password!!!');
    }
  }

  Future<void> toHomeScreen() async {
    final userId = _authData['email'];

    Navigator.of(_navigatorKey.currentContext!)
        .pushReplacementNamed(Home.routeName, arguments: {"userId": userId});
  }

  void _showErrorDialog(String message) {
    var context = _navigatorKey.currentContext;
    if (context != null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error!'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.blue,
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.white.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 15,
            child: Container(
              width: 500,
              height: 400,
              padding: EdgeInsets.all(40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'E-Mail'),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          _authData['email'] = value != null ? value : '';
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        controller: _passwordController,
                        obscureText: true,
                        onSaved: (value) {
                          _authData['password'] = value != null ? value : '';
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 150, height: 40),
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.login),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Login'),
                            ],
                          ),
                          onPressed: () {
                            _login(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              textStyle: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
