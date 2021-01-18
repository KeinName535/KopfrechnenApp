//import 'dart:html';

import 'package:HelloWorld/screens/LoggedIn/home.dart';
import 'package:HelloWorld/screens/notLoggedIn/login.dart';
import 'package:HelloWorld/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
            backgroundColor: Colors.blue[400],
            elevation: 0.0,
            title: Text('SignIn')),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Column(children: [
              RaisedButton(
                child: Text('SignInAnonymous'),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print('error signing in');
                    print(result);
                  } else {
                    print('signedIn');
                    print(result.uid);
                  }
                },
              ),
              RaisedButton(
                child: Text('SignInViaE-Mail'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
              ),
            ])));
  }
}
