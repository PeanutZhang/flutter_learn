import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'RandomWordsState.dart';


void main() => runApp(new MyApp());

//class MyApp extends StatelessWidget {
//
//
//  Widget _c1() {
//    return new Center(
//      child: new Container(
//        constraints: BoxConstraints.expand(height: 80, width: 80),
//        margin: const EdgeInsets.all(16),
//        color: Colors.deepOrange,
//        width: 64,
//        height: 64,
//      ),
//    );
//  }
//
//  Widget _row() {
//    return new MaterialApp(
//      home: new Row(
//        children: <Widget>[
//          Expanded(child: Text('de', textAlign: TextAlign.center,),),
//          Expanded(child: Text('cra', textAlign: TextAlign.center,),),
//          Expanded(child: FittedBox(
//            fit: BoxFit.contain,
//            child: const FlutterLogo(),
//          ),)
//        ],
//      ),
//    );
//  }
//
//  Widget _column1() {
//    return new MaterialApp(
//      home: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          Text('We move under cover and we move as one'),
//          Text('Through the night, we have one shot to live another day'),
//          Text('We cannot let a stray gunshot give us away'),
//          Text('We will fight up close, seize the moment and stay in it'),
//          Text('It’s either that or meet the business end of a bayonet'),
//          Text('The code word is ‘Rochambeau,’ dig me?'),
//        ],
//      ),
//    );
//  }
//
//  Widget _text() {
//    return new MaterialApp(
//      title: 'this title',
//      home: new Container(
//        padding: const EdgeInsets.only(top: 30),
//        child: new Text(
//          'hi xiaofei how are you   fight up close, seize the moment and stay in it'
//          , textAlign: TextAlign.justify,
//          overflow: TextOverflow.visible,
//          style: TextStyle(
//              fontWeight: FontWeight.normal, color: Colors.red, fontSize: 20),
//        ),
//      ),
//    );
//  }
//
//  Widget _textRich() {
//    return new MaterialApp(
//        home:
//        new Center(
//          child: const Text.rich(
//            TextSpan(
//                text: '  hi xf jjljljijlijljijajzijejhjtyhzajp;;;;',
//                children: <TextSpan>[
//                  TextSpan(text: ' beautiful ',
//                      style: TextStyle(
//                          fontStyle: FontStyle.italic, color: Colors.green)),
//                  TextSpan(text: 'girl',
//                      style: TextStyle(fontWeight: FontWeight.bold)),
//                ],
//                style: TextStyle(fontSize: 20, decoration: TextDecoration.none)
//            ),
//            textAlign: TextAlign.left,
//            softWrap: true,
//          ),
//
//        )
//    );
//  }
//
//  Widget _icon() {
//    return new MaterialApp(
//      home: new Container(
//        child: Icon(
//          Icons.add_circle,
//          color: Colors.deepPurpleAccent,
//          size: 60,
//        ),
//      ),
//    );
//  }
//
//  Widget _raiseButton() {
//    return new Center(
//
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          RaisedButton(onPressed: () {},
//            child: Text('disabled button', style: TextStyle(fontSize: 20),),),
//          const SizedBox(height: 30,),
//          RaisedButton(onPressed: () {},
//            child: const Text(
//              'Enable button', style: TextStyle(fontSize: 20),),),
//          const SizedBox(height: 30,),
//          RaisedButton(onPressed: () {},
//            color: Colors.deepPurpleAccent,
//            padding: const EdgeInsets.all(0.0),
//            child: Container(
//              decoration: const BoxDecoration(
//                  gradient: LinearGradient(colors: <Color>[ Color(0xFF0D47A1),
//                  Color(0xFF1976D2),
//                  Color(0xFF42A5F5),
//                  ])
//              ),
//              padding: const EdgeInsets.all(0.0),
//              child: const Text(
//                'gradient button', style: TextStyle(fontSize: 20),),
//            ),
//          )
//        ],
//      ),
//
//    );
//  }
//
//  Widget _st() {
//    return new MaterialApp(
//      home: _dropMenuButton(),
//    );
//  }
//
//  String itemValue = 'Zyh';
//
//  Widget _dropMenuButton() {
//    return Scaffold(
//      body: Center(
//        child: DropdownButton<String>(
//          items: <String>["XF", "XF", "X F"].map<DropdownMenuItem<String>>((
//              String value) {
//            return DropdownMenuItem<String>(
//              value: value,
//              child: Text(value,
//                style: TextStyle(fontSize: 25, color: Colors.lightGreen),),
//            );
//          }).toList(),
//        ),
//      ),
//    );
//  }
//
//  var count = 1;
//
//  Widget _scaffold(BuildContext context) {
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
////    return new MaterialApp(
////      title: 'my first Flutter app',
////      theme: new ThemeData(
////        primaryColor: Colors.purpleAccent
////      ),
////      home: new RandomWords()
////    );
//    return MaterialApp(home: Scaffold(
//      appBar: AppBar(title: Text('bar'),),
//      body: Center(child: Text('you pressed the button $count times'),),
//      bottomNavigationBar: BottomAppBar(child: Container(height: 50,)),
//      floatingActionButton: FloatingActionButton(onPressed: (){},
//        tooltip: 'tooltip',
//        child: Icon(Icons.add),
//
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//    ));
//  }
//
//}
//
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();

}


/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}