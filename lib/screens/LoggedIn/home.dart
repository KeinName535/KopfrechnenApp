import 'package:HelloWorld/Models/User.dart';
import 'package:HelloWorld/services/auth.dart';
import 'package:HelloWorld/shared/loading.dart';
import 'package:flutter/material.dart';
import 'Kopfrechnen.dart';
import 'package:HelloWorld/services/Database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData daten = snapshot.data;
            return Scaffold(
                appBar: AppBar(
                  title: Text('Menü ' + daten.name),
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
                      child:
                          Text('Start Quiz!', style: TextStyle(fontSize: 48))),
                  Row(children: <Widget>[
                    Text('Highscore:  '),
                    Text(daten.highscore),
                  ])
                ])));
          } else {
            return Loading();
          }
        });
  }
}
