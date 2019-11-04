
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:isolate';
import 'dart:async';
class AsyncDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'this the async demo',
      home: ContentWidget(),
    );
  }

}

class ContentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContentState();
  }

}

class ContentState extends State<ContentWidget>{

  List widgets = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     loadDataByIsloate();
  }

  void loadData() async {

    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);
    setState(() {
      widgets = json.decode(response.body);
    });

  }

  void loadDataByIsloate() async{

    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;
    List msg = await sendRecive(sendPort, 'https://jsonplaceholder.typicode.com/posts');
    setState(() {
      widgets = msg;
    });

  }

  static dataLoader(SendPort sendPort) async{

    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    await for(var msg in receivePort){
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataUrl = data;
      http.Response response = await http.get(dataUrl);
      replyTo.send(json.decode(response.body));
    }

  }
  Future sendRecive(SendPort sendPort,msg){
    ReceivePort resp = ReceivePort();
    sendPort.send([msg,resp.sendPort]);
    return resp.first;
  }

  showLoading(){
    if(widgets.length == 0){
      return true;
    }else{
      return false;
    }
  }

  getBody(){
    if(showLoading()){
      return getProgressDialog();
    }else{
       return getListView();
    }
  }

  getProgressDialog(){
    return Center(child: CircularProgressIndicator(),);
  }

  ListView getListView(){
       return  ListView.builder(itemBuilder: (BuildContext ct,int position)=>getRow(position),
    itemCount: widgets.length,);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:getBody(),
    );

  }

  Widget getRow(int position){
    return Container(
      margin: EdgeInsets.only(left:12.0,right: 12.0),
      padding: EdgeInsets.all(12.0),
      decoration:BoxDecoration(
        border: Border(bottom: BorderSide(width:2,color: Colors.blue,)),
      ),
      child: Text('row ${widgets[position]["title"]}',style: TextStyle(color: Colors.red,fontStyle: FontStyle.italic),),
    );
  }

}