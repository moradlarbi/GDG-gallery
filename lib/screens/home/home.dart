import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_gallery_app_prototype/services/auth.dart';
import 'package:gdg_gallery_app_prototype/services/storage.dart';
import 'package:gdg_gallery_app_prototype/Models/Event.dart';
import 'package:provider/provider.dart';
import 'package:gdg_gallery_app_prototype/services/database.dart';

import 'EventList.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authserv = AuthService();
    return StreamProvider<List<Event>?>.value(
      value: DatabaseService(uid: 'a').events,
      initialData: null,
      child: Scaffold(
        backgroundColor: Color(0xff00387A),
        appBar: AppBar(
          title: Text('Events', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xff00387A),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              onPressed: () async {
                await authserv.signOut();
              },
              label: Text('Sign Out', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      body: EventList(),
      ),
    );
  }
}




