import 'package:flutter/material.dart';

class BuildUIWidget extends StatelessWidget{

  Widget card = SizedBox(
    height: 210.0,
    child: Card(
      child: Column(
        children: <Widget>[
          ListTile(leading: Icon(Icons.restaurant_menu,color: Colors.blue,),
                   title:Text('1625 邪恶大道',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            subtitle:Text('无限制街道，为所欲为'),
          ),
          Divider(height: 1,color: Colors.blue,indent: 12.0,endIndent: 12.0,),
          ListTile(leading: Icon(Icons.hotel,color: Colors.deepOrangeAccent,),
                  title: Text('adult hotel',style: TextStyle(color: Colors.greenAccent),),
                  subtitle: Text('do anything what you want',style: TextStyle(color: Colors.grey),),
          ),
          ListTile(leading: Icon(Icons.local_hospital,color: Colors.red,),
          title: Text('Hospital',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
            subtitle: Text('It does\'t save people but kill people',style: TextStyle(color: Colors.purpleAccent),),
          )
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'the tile',
      home: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 20),
        child: card,
      ),
    );
  }

}