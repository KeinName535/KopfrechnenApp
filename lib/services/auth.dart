import 'package:HelloWorld/services/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:HelloWorld/Models/User.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create User based on FirebasUser
  User _userfromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user Stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userfromFirebaseUser(user));
  }

//sign in anonymous
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData('John', '0');
      return _userfromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with e-mail and passwort
  Future LoginEmail(String email, String pw) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pw);
      FirebaseUser user = result.user;
      //create User document

      return _userfromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with e-mail and passwort
  Future registerEmail(String email, String pw) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pw);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData('John', '0');
      return _userfromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }
}
