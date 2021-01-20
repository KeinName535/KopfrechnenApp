import 'package:HelloWorld/screens/notLoggedIn/Register.dart';
import 'package:HelloWorld/screens/notLoggedIn/Sign_In.dart';
import 'package:HelloWorld/screens/notLoggedIn/anon.dart';
import 'package:HelloWorld/screens/notLoggedIn/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'anon.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  int signInPage = 0;
  bool anonn = true;
  void changePage(int x) {
    setState(() => signInPage = x);
  }

  void changeanon() {
    setState(() => anonn = false);
  }

  @override
  Widget build(BuildContext context) {
    if (anonn) {
      return Container(
          child: SignIn(changePage: changePage, changeanon: changeanon));
    } else {
      if (signInPage == 0) {
        return Container(child: Anon(/*changeanon: changeanon*/));
      } else if (signInPage == 1) {
        return Container(child: Login(changeanon: changeanon));
      } else {
        return Container(child: Register(changeanon: changeanon));
      }
    }
  }
}
