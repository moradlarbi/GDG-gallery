import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference eventCollection = FirebaseFirestore.instance.collection('events');

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future addEvent(String name, String date) async {
    return await eventCollection.doc(name+date).set({
      'name':name,
      'date':date
    });
  }

  Future newUser(String name,String password) async {
    return usersCollection.doc(uid).set({
      'mail': name,
      'password': password
    });
  }
}