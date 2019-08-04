import 'package:flutter/material.dart';


class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget titlelayout = Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Oeschinen Lake Campground',style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Text('Kandersteg,Switzerland',style: TextStyle(color: Colors.grey),)
            ],
          )
          ),
          Icon(Icons.star,size: 32,color: Colors.red,),
          MaterialButton(
           padding: EdgeInsets.only(left: 8),
            child: Text('55'),
            onPressed: (){
             Navigator.of(context).pushNamed('/signup');
            },
          )
        ],
      ),
    );

    Column buttonColumn(IconData icon,String lable){

      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon,color: color,),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(lable,
            style: TextStyle(fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color),
            ),
          )
        ],
      );

    }
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buttonColumn(Icons.call, 'Call'),
          buttonColumn(Icons.near_me, 'Route'),
          buttonColumn(Icons.share, 'Share')
        ],
      ),
    );
    Widget textSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Text('''
      Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
      ''',
      softWrap: true,),
    );

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue,
    ),
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Image.asset('images/lake.jpg',
            width: 600,height: 240,
              fit: BoxFit.cover,
            ),
            titlelayout,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

}