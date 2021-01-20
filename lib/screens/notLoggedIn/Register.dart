import 'package:HelloWorld/screens/LoggedIn/home.dart';
import 'package:HelloWorld/services/auth.dart';
import 'package:HelloWorld/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function changeanon;
  Register({this.changeanon});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  Text('Register'),
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
                        return 'Enter valide E-Mail';
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
                            return 'Enter a password';
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
                                    await _auth.registerEmail(eMail, pw);
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
                            child: Text('Register')),
                        /*RaisedButton(
                            onPressed: widget.changeanon(),
                            child: Text('toLogin'))*/
                      ],
                    ),
                    Text(error)
                  ]))
            ]));
  }
}
