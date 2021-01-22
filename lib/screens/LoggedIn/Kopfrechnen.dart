import 'package:HelloWorld/screens/LoggedIn/home.dart';
import 'package:HelloWorld/services/Database.dart';
import 'package:flutter/material.dart';
import 'Generator.dart';
import 'dart:math';
import 'package:HelloWorld/Models/User.dart';
import 'package:provider/provider.dart';

class Kopfrechnen extends StatefulWidget {
  @override
  _KopfrechnenState createState() => _KopfrechnenState();
}

//DatabaseService database;
//FirebaseUser user;

class _KopfrechnenState extends State<Kopfrechnen> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    int testforNull(int x) {
      if (x == null) {
        return 0;
      } else {
        return x;
      }
    }

    bool truegiven = false;
    bool nonetrue = false;

    int Zufallszahl(int z) {
      var randomizer = Random();
      int zahl = randomizer.nextInt(z);
      return zahl;
    }

    String getOperator() {
      int ops = Zufallszahl(3);
      if (ops == 0) {
        return '+';
      } else if (ops == 1) {
        return '-';
      } else if (ops == 2) {
        return '*';
      } else if (ops == 3) {
        return '/';
      }
    }

    int checkforTrue() {
      if (truegiven == true) {
        return 4;
      } else {
        var randomizer = Random();
        int z = randomizer.nextInt(3);
        if (z == 1) {
          //truegiven = true;
          nonetrue = true;
          return 1;
        } else {
          return 4;
        }
      }
    }

    int checkforTrueNone() {
      if (nonetrue == false) {
        return 1;
      } else {
        return 4;
      }
    }

    int getNumber(String Op) {
      if ((Op == '+') || (Op == '-')) {
        return Zufallszahl(200);
      } else if (Op == '/') {
        return Zufallszahl(100);
      } else if (Op == '*') {
        return Zufallszahl(50);
      }
    }

    String Operator = getOperator();
    int zahl1 = getNumber(Operator);
    int zahl2 = getNumber(Operator);

    int OpErg(int x, int y, String z) {
      if (z == '+') {
        return x + y;
      } else if (z == '-') {
        return x - y;
      } else if (z == '*') {
        return x * y;
      } else if (z == '/') {
        int i = (x / y).round();
        return i;
      }
    }

    int nearErg(int x, int y, String z) {
      if (z == '+') {
        return Generator_add(x, y);
      } else if (z == '-') {
        return Generator_sub(x, y);
      } else if (z == '*') {
        return Generator_mult(x, y);
      } else {
        return Generator_div(x, y);
      }
    }

    void _increase_score() {
      setState(() {
        score = testforNull(score) + 1;
        Operator = Operator;
        zahl1 = zahl1;
        zahl2 = zahl2;
      });
    }

    void _decrease_score() {
      setState(() {
        score = testforNull(score) - 1;
        Operator = Operator;
        zahl1 = zahl1;
        zahl2 = zahl2;
      });
    }

    final user = Provider.of<User>(context);
    Future compare_score(String highscore) async {
      if (score > int.parse(highscore)) {
        DatabaseService(uid: user.uid).updateUserData('John', score.toString());
      }
    }

    void ergebnis(var x, String highscore) {
      if (x == 1) {
        showDialog<AlertDialog>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(title: Text('Richtig! Score + 1'), actions: [
                new FlatButton(
                  child: Row(
                      children: <Widget>[Text('zum Menü'), Icon(Icons.home)]),
                  onPressed: () {
                    score = testforNull(score) + 1;
                    compare_score(highscore);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                ),
                new FlatButton(
                    onPressed: () {
                      compare_score(highscore);
                      setState(() {
                        score = testforNull(score) + 1;
                        build(context);
                      });
                      Navigator.pop(context);
                    },
                    child: Row(children: <Widget>[
                      Text('nächste Frage'),
                      Icon(Icons.arrow_forward)
                    ]))
              ]);
            });
      } else {
        showDialog<AlertDialog>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text('Schade, das war Falsch!'),
                  content: SizedBox(
                      height: 60,
                      child: Column(children: <Widget>[
                        Text('Das Ergebnis ist:'),
                        Text((OpErg(zahl1, zahl2, Operator)).toString()),
                        Text('Score - 1'),
                      ])),
                  actions: [
                    new FlatButton(
                      child: Row(children: <Widget>[
                        Text('zum Menü'),
                        Icon(Icons.home)
                      ]),
                      onPressed: () {
                        _decrease_score();
                        compare_score(highscore);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      },
                    ),
                    new FlatButton(
                        child: Row(children: <Widget>[
                          Text('nächste Frage'),
                          Icon(Icons.arrow_forward)
                        ]),
                        onPressed: () {
                          compare_score(highscore);
                          _decrease_score();
                          Navigator.pop(context);
                        })
                  ]);
            });
      }
    }

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userdata,
        builder: (context, snapshot) {
          UserData daten = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                  title: Row(children: <Widget>[
                    Text('Quiz                                    '),
                    Text('Score:'),
                    Text(testforNull(score).toString())
                  ]),
                  backgroundColor: Colors.lightBlue),
              body: ListView.builder(
                itemCount: ((MediaQuery.of(context).size.height) / 100).round(),
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return Container(
                        width: 400,
                        height: 85.7,
                        //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black, width: 4)),
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('Was ist ',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black)),
                                Text(zahl1.toString(),
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black)),
                                Text(Operator,
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black)),
                                Text(zahl2.toString(),
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black)),
                                Text('?',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black))
                              ]),
                        ));
                  } else if (i !=
                      (((MediaQuery.of(context).size.height) / 100).round()) -
                          1) {
                    int Constructor = checkforTrue();
                    int Solution = 0;
                    if (Constructor == 1) {
                      Solution = OpErg(zahl1, zahl2, Operator);
                      truegiven = true;
                    } else {
                      Solution = nearErg(zahl1, zahl2, Operator);
                    }
                    return Container(
                      width: 400,
                      height: 85.7,
                      //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.black, width: 4)),
                      child: Center(
                          child: RaisedButton(
                              onPressed: () =>
                                  ergebnis(Constructor, daten.highscore),
                              child: Text(Solution.toString(),
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black)))),
                    );
                  } else {
                    return Container(
                      width: 400,
                      height: 85.7,
                      //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.black, width: 4)),
                      child: Center(
                          child: RaisedButton(
                              onPressed: () =>
                                  ergebnis(checkforTrueNone(), daten.highscore),
                              child: Text('None',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black)))),
                    );
                  }
                },
              ));
        });
  }
}
