import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_app/PhotoWidget.dart';

class HeroAnimation extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('hero demo'),
      ),
      body: Center(
        child: PhotoWidget(
          photo: 'images/scenery.jpg',
          width: 300,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder:(BuildContext context)=> Scaffold(
                  appBar: AppBar(title: Text('heroDemo'),),
                  body: Container(
                    color: Colors.lightBlueAccent,
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: PhotoWidget(
                      width: 100,
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      photo: 'images/scenery.jpg',
                    ),
                  ),
                )
             ),
            );
          },
        ),
      ),
    );

  }


}