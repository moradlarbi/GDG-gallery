import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gdg_gallery_app_prototype/screens/home/ImagesPage.dart';
import 'package:gdg_gallery_app_prototype/shared/states.dart';
import 'package:provider/provider.dart';
import 'package:gdg_gallery_app_prototype/Models/Event.dart';

import 'EventTile.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);



  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {

  List<String> images = [];


  @override
  Widget build(BuildContext context) {

    final events = Provider.of<List<Event>?>(context);

    if (events!=null) {
      events.forEach((event) {
        print(event.name);
      });

      return Container(
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder:(context, index) {
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ImagesPage(event: events[index])));
                        },
                        leading: Icon(Icons.image, color: Colors.black, size: 40,),
                        title: Text(events[index].name, style: TextStyle(color: Colors.black, fontFamily: 'roberto', fontSize: 30),),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
    else return Container();
  }
}
