import 'package:HelloWorld/screens/LoggedIn/home.dart';
import 'package:HelloWorld/screens/notLoggedIn/Register.dart';
import 'package:HelloWorld/services/auth.dart';
import 'package:HelloWorld/shared/loading.dart';
import 'package:flutter/material.dart';
//import 'Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  final Function changeanon;
  Login({this.changeanon});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _key3 = GlobalKey<FormState>();

  String eMail = '';
  String pw = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
                title: Row(children: <Widget>[
                  Text('Login'),
                ]),
                backgroundColor: Colors.lightBlue),
            body: Column(children: <Widget>[
              Form(
                  key: _key3,
                  child: Column(children: <Widget>[
                    Text('E-Mail'),
                    TextFormField(onChanged: (val) {
                      setState(() => eMail = val);
                    }, validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter an E-Mail';
                      } else if (value.contains('@') == false) {
                        return 'Wrong password or E-Mail';
                      } else {
                        return null;
                      }
                    }),
                    Text('password'),
                    TextFormField(
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => pw = val);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Wrong password or E-Mail';
                          } else if (value.length <= 6) {
                            return 'password has to be at least 6 digits';
                          } else {
                            return null;
                          }
                        }),
                    Row(
                      children: [
                        RaisedButton(
                            onPressed: () async {
                              if (_key3.currentState.validate()) {
                                dynamic result =
                                    await _auth.LoginEmail(eMail, pw);
                                setState(() {
                                  loading = true;
                                });
                                /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));*/
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = 'please check your data';
                                  });
                                }
                              } else {
                                print('hi');
                              }
                            },
                            child: Text('LogIn')),
                        /*RaisedButton(
                            onPressed: widget.changeanon(),
                            child: Text('New Account')),*/
                      ],
                    ),
                    Text(error)
                  ]))
            ]));
  }
}
