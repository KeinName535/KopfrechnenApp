import 'package:HelloWorld/screens/notLoggedIn/Register.dart';
import 'package:HelloWorld/services/auth.dart';
import 'package:flutter/material.dart';
//import 'Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

FirebaseUser user;

class _LoginState extends State<Login> {
  // text field State
  final AuthService _auth = AuthService();
  String eMail = '';
  String pw = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _set_Values(String text) {
    if (formKey.currentState.validate()) {
      setState(() {
        eMail = text;
      });
    }
  }

  void toRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> formKey2 = GlobalKey();
  String itemUs;
  String itemPw;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(children: <Widget>[
              Text('SignIn'),
            ]),
            backgroundColor: Colors.lightBlue),
        body: Column(children: <Widget>[
          Text('E-Mail'),
          Form(
              key: formKey,
              child: TextFormField(
                onChanged: (val) {
                  setState(() => eMail = val);
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter a Value';
                  }
                  return null;
                },
              )),
          Text('password'),
          Form(
              key: formKey2,
              child: TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => pw = val);
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter a Value';
                  }
                  return null;
                },
              )),
          Row(
            children: [
              RaisedButton(
                  onPressed: () async {
                    _set_Values('hi');
                  },
                  child: Text('Submit')),
              OutlineButton(
                  onPressed: () {
                    toRegister();
                  },
                  child: Text('new Account'))
            ],
          )
        ]));
  }
}
