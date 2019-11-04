import 'package:flutter/material.dart';

class CollectPersonInfoPage extends StatelessWidget{

  List<Container> _buildGridTileList(int count){
    return List<Container>.generate(count, (index)=>Container(child: Image.asset('images/mm${index+1}.jpg',fit: BoxFit.fill,),));
  }
  Widget buildGrid(){
    return GridView.extent(maxCrossAxisExtent: 150,
    padding: EdgeInsets.all(4.0),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
        children: _buildGridTileList(10),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('gridView'),),
        body: Center(
          child: buildGrid(),
        ),
      ),
    );
  }

}