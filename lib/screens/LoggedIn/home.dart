import 'package:HelloWorld/services/auth.dart';
import 'package:flutter/material.dart';
import 'Kopfrechnen.dart';
//import 'constants.dart';
//import 'package:shared_preferences/shared_preferences.dart';

//import 'googleauth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menü'),
          backgroundColor: Colors.lightBlue,
          actions: [
            FlatButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text('SignOut'))
          ],
        ),
        body: Center(
            child: Column(children: [
          RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Kopfrechnen(),
                    ));
              },
              child: Text('Start Quiz!', style: TextStyle(fontSize: 48))),
          Row(children: <Widget>[
            Text('Highscore:'),
            Text(' highscore/UserfromLogin')
          ])
        ])));
  }
}
