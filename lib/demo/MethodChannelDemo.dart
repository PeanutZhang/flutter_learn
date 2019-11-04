import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
class MethodChannelDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.light(),
      home: MethodChannel(),
    );
  }
}

class MethodChannel extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MethodChannelState();
  }

}

class MethodChannelState extends State<MethodChannel>{

  String _battery='sdffs';

  Future<Null> _getBatteryLevel() async{
    String batteryLevel;
    try{
    } on PlatformException catch (e){

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('communication with native'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
              child:Center(
                child: Text(_battery,style: TextStyle(fontSize: 20),),
              )
          ),
          Container(
            height: 46.0,
            alignment: Alignment.center,
            child: RaisedButton(onPressed: null,child: Text('get divice\'s battery',style: TextStyle(fontSize: 18),),),
          )
        ],
      ),
    );
  }

}
