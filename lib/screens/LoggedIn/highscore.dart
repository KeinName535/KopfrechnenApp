import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Highscore extends StatefulWidget {
  @override
  _HighscoreState createState() => _HighscoreState();
}

class _HighscoreState extends State<Highscore> {
  @override
  Widget build(BuildContext context) {
    final highscore = Provider.of<QuerySnapshot>(context);

    return Container(child: Text('hi'));
  }
}
