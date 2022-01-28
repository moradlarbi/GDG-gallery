import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gdg_gallery_app_prototype/Models/Event.dart';

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

  //event list from snapshot
  List<Event> _eventListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){

      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;

      List<dynamic> imagesdyn = data['images'];
      List<String> images = imagesdyn.map((s) => s as String).toList();

      return Event(name: data['name'] ?? '', date: data['date'] ?? '' ,images: images);
    }).toList();
  }

  Stream<List<Event>> get events {
    return eventCollection.snapshots().map(_eventListFromSnapshot);
  }


}