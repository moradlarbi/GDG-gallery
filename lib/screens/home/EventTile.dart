import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_gallery_app_prototype/Models/Event.dart';

class EventTile extends StatelessWidget {

  final Event event;

  EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6, 20, 0),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget> [
              ListTile(
                onTap: () {
                  print('test');
                },
              leading: Icon(Icons.image, color: Colors.black, size: 40,),
               title: Text(event.name, style: TextStyle(color: Colors.black, fontFamily: 'roberto', fontSize: 30),),
        ),
            ],
          ),
    ),
      ),
    );
  }
}
