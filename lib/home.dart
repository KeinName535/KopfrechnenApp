import 'package:flutter/material.dart';
import 'Kopfrechnen.dart';
//import 'constants.dart';
//import 'package:shared_preferences/shared_preferences.dart';

//import 'googleauth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menü'),
          backgroundColor: Colors.lightBlue,
          actions: [FlatButton(onPressed: null, child: Text('SignOut'))],
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
