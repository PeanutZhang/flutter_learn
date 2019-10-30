import 'package:flutter/material.dart';

class HomePageD1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'flutter实战1',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: ListWidget(),
    );
  }
}

class ListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListWidgetState();
  }
}

class ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Practices"),),
      backgroundColor: Colors.blue,
      body: ListView.builder(itemBuilder: (context,index){
           return _buildListItem();
      },itemCount: 20,
      )
    );
  }

  _buildBottomLayout(IconData icon, String text) {
    return Expanded(
        flex: 1,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                icon,
                size: 16.0,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ));
  }

  _buildListItem() {
    return Container(
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(7.5),
        child: FlatButton(
            onPressed: () {},
            child: Padding(
                           padding: EdgeInsets.only(left:0.0,top:5.0,right: 0.0,bottom: 5.0),
                           child: Column(
                             mainAxisSize: MainAxisSize.max,
                             children: <Widget>[
                               Container(child: Text("卡片描述信息描述信息描述信息描述信息描述信息描述信息描述信息",style: TextStyle(color: Colors.black54,fontSize: 18,fontStyle: FontStyle.italic,),maxLines: 3,overflow: TextOverflow.ellipsis,),
                                 alignment: Alignment.topLeft,
                               ),
                               Padding(padding: EdgeInsets.only(left:0.0,top: 5.0,right: 0,bottom:5.0)),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: <Widget>[
                                   _buildBottomLayout(Icons.star, "1050"),
                                   _buildBottomLayout(Icons.local_cafe, "1800"),
                                   _buildBottomLayout(Icons.local_bar, "2019")
                                 ],
                               )
                             ],
                           ) ,)),
      ),
    );
  }
}
