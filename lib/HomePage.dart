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
         _MyFavoriteWidget()
        ],
      ),
    );

    Column buttonColumn(IconData icon,String lable,VoidCallback callback){

      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon,color: color,),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: MaterialButton(onPressed: callback,child:Text(lable,
            style: TextStyle(fontSize: 24,
            fontWeight: FontWeight.w400,
            color: color),
            ),)
          )
        ],
      );

    }
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buttonColumn(Icons.call, 'Call',(){
          Navigator.of(context).pushNamed('/buildUi');
          }),
          buttonColumn(Icons.near_me, 'Route',(){Navigator.of(context).pushNamed('/signup');
          }),
          buttonColumn(Icons.forward, 'Animation',(){Navigator.of(context).pushNamed('/anidemo');})
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
            Column(
              children: <Widget>[
                MaterialButton(child: Text('Async Demo request internet'),onPressed: (){Navigator.of(context).pushNamed('/asyncdemo');},color: Colors.blue,elevation: 5.0,),
                MaterialButton(child: Text('picker image'),onPressed: (){Navigator.of(context).pushNamed('/pickImg');},color: Colors.blue,elevation: 5.0,)

              ],
            ),
            textSection,
          ],
        ),
      ),
    );
  }

}

class _MyFavoriteWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFavoriteWidgetState();
  }

}

class _MyFavoriteWidgetState extends State<_MyFavoriteWidget>{
  bool _isFavorite = true;
  int  _favoriteCount = 41;

  void _toggleFavorite(){

    setState(() {

      if(_isFavorite){
         _favoriteCount -=1;
      }else{
        _favoriteCount += 1;
      }
      _isFavorite = !_isFavorite;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(18.0),
          child: IconButton(icon: Icon(_isFavorite ? Icons.star : Icons.star_border,color: Colors.red,), onPressed: _toggleFavorite),
        ),
        SizedBox(
          width: 18.0,
          child: Container(child: Text('$_favoriteCount'),),
        )
      ],
    );
  }

}