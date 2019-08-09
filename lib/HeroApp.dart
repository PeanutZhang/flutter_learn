import 'package:flutter/material.dart';
import 'package:flutter_app/HeroAnimation.dart';
class HeroApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HeroAnimation(),
    );
  }
}