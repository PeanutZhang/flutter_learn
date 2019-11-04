


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/practices/HomePageD1.dart';

import 'demo/AnimatedListDemo.dart';
import 'demo/AnimationDemo.dart';
import 'demo/AsyncDemo.dart';
import 'demo/BuildUIWidget.dart';
import 'demo/ChatDemo.dart';
import 'demo/HeroApp.dart';
import 'demo/HomePage.dart';
import 'demo/ListLoadMoreDemo.dart';
import 'demo/MethodChannelDemo.dart';
import 'demo/PickImage.dart';
import 'demo/SignUpPage.dart';


void main() => runApp(MainApp());

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
         initialRoute: '/',
        routes: {
          '/': (BuildContext c) => HomePage(),
          '/signup':(BuildContext c)=> SignUpPage(),
          '/buildUi':(BuildContext c)=> BuildUIWidget(),
          '/anidemo':(BuildContext c)=> AnimationDemo(),
          '/asyncdemo':(BuildContext c) => AsyncDemo(),
          '/pickImg':(BuildContext c)=> PickImage(),
          '/chat':(BuildContext c)=>ChatDemo(),
          '/animatedList':(BuildContext c)=> AnimatedListDemo(),
          '/heropage':(BuildContext c)=>HeroApp(),
          '/methodchannel':(BuildContext c )=>MethodChannelDemo(),
          '/listV':(BuildContext c)=>ListLoadMoreDemo(),
          '/listC':(BuildContext c)=>HomePageD1(),
        }
    );
  }

}