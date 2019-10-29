import 'package:flutter/material.dart';

class HomePageD1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'flutter实战1',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: scop,
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
    return null;
  }

  _buildBottomLayout(IconData icon, String text) {
    return Expanded(
        flex: 1,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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

  _buildListItem(IconData icon, String text) {
    return Container(
      child: Card(
        child: FlatButton(
            onPressed: () {},
            child: Padding(
                           padding: EdgeInsets.all(10.0),
                           child: Column(
                             mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                               Container(child: Text("卡片描述信息",style: TextStyle(color: Colors.black54,fontSize: 18,fontStyle: FontStyle.italic,),maxLines: 3,overflow: TextOverflow.ellipsis,),
                                 margin: EdgeInsets.only(top: 6.0,bottom: 2.0),
                                 alignment: Alignment.topLeft,
                               ),
                               Padding(padding: EdgeInsets.all(10.0)),
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
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
