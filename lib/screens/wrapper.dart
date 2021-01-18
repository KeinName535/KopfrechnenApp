import 'package:HelloWorld/Models/User.dart';
import 'package:HelloWorld/screens/LoggedIn/home.dart';
import 'package:HelloWorld/screens/notLoggedIn/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return home or auth
    if (user == null) {
      return Auth();
    } else {
      return Home();
    }
  }
}
