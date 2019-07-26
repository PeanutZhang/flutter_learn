import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'RandomWordsState.dart';



void main() => runApp(new MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new MaterialApp(
      title: 'my first Flutter app',
      theme: new ThemeData(
        primaryColor: Colors.purpleAccent
      ),
      home: new RandomWords()
    );
  }



}
class RandomWords extends StatefulWidget{
  @override
   createState() => new RandomWordsState();

}