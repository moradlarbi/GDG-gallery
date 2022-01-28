import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_gallery_app_prototype/Models/Event.dart';
import 'package:gdg_gallery_app_prototype/services/storage.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({required this.event});

  final Event event;


  @override
  _ImagesPageState createState() => _ImagesPageState(event: event);
}

class _ImagesPageState extends State<ImagesPage> {

  _ImagesPageState({required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff00387A),
        appBar: AppBar(
          title: Text(event.name, style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xff00387A),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.add, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
              label: Text('Add Image', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
        body: ListView.builder(
                itemCount: event.images.length,
                itemBuilder: (context,index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        CachedNetworkImage(
                          imageUrl: event.images[index],
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        ),
                      ],
                    ),

                  );

                }
            ),



    );


  }
}

Future<Widget?> getImage(BuildContext context, String imageName) async {
  Image image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(value.toString(), fit: BoxFit.scaleDown);
    return image;
  });
}
