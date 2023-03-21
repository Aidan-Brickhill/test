import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/models/brew.dart';
import 'package:test/models/user.dart';

class DatabaseService {
  //collection reference
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference brewcollection =
      FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String Sugars, String Name, int Strength) async {
    return await brewcollection.doc(uid).set({
      'sugars': Sugars,
      'name': Name,
      'strength': Strength,
    });
  }

  //usefata from snaphsot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        sugars: snapshot.get('sugars'),
        strength: snapshot.get('strength'),
        name: snapshot.get('name'));
  }

  //get list of brews from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
          name: doc.get('name') ?? '',
          sugars: doc.get('sugars') ?? '0',
          strength: doc.get('strength') ?? 0);
    }).toList();
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return brewcollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userdata {
    return brewcollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
