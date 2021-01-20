import 'package:HelloWorld/screens/notLoggedIn/Authentication.dart';
import 'package:HelloWorld/services/auth.dart';
import 'package:flutter/material.dart';

class Anon extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
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
    );
  }
}
