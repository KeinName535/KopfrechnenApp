import 'package:HelloWorld/Models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

//collection reference
  final CollectionReference userData =
      Firestore.instance.collection('UserData');

//User data from Snapshot

//create and Update Userdocument
  Future updateUserData(String name, String highscore) async {
    return await userData.document(uid).setData({
      'highscore': highscore,
      'name': name,
    });
  }

  UserData _userdatafromsnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      highscore: snapshot.data['highscore'] ?? '',
      name: snapshot.data['name'] ?? 'Hi',
    );
  }

  Stream<UserData> get userdata {
    return userData.document(uid).snapshots().map(_userdatafromsnapshot);
  }
}
