import 'package:flutter/material.dart';
import 'package:gdg_gallery_app_prototype/services/auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authserv = AuthService();
    return Container(
      child: Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await authserv.signOut();
              },
              label: Text('Sign Out'),
            )
          ],
        ),
      body: Row(
        children: [
          const Text('Home'),
          ]
       ),
      ),
    );
  }
}
