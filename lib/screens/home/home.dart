import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_gallery_app_prototype/services/auth.dart';
import 'package:gdg_gallery_app_prototype/services/storage.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authserv = AuthService();
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xff00387A),
        appBar: AppBar(
          title: Text('Home', style: TextStyle(color: Colors.white)),
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
      body: Row(
        children: [
          const Text('Home'),

          ]
       ),
      ),
    );
  }
}

Future<Widget?> getImage(BuildContext context, String imageName) async {
  Image image;
  await FireStorageService.loadImage(context, imageName).then((value){

    image = Image.network(value.toString(), fit: BoxFit.scaleDown);
    return image;
  });

}
