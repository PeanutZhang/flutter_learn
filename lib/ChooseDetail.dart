import 'package:flutter/material.dart';
class ChooseDetail extends StatelessWidget{
  final VoidCallback onSignUpComplete;

  ChooseDetail({this.onSignUpComplete});

  final List<String> items= new List<String>.generate(20, (index)=>'$index + item ');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'dismissing item',
      home: Scaffold(
        appBar: AppBar(title: Text('侧滑删除'),),
        body: ListView.builder(itemBuilder: (context,index){
          final item = items[index];
          return Dismissible(key: Key(item),
            child:ListTile(title: Text('$item'),),
            onDismissed: (direction){
            items.removeAt(index);
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('$item dismissed')));
            },
            background: Container(color: Colors.red,child: Text('删除'),width: 20,height: 20,),
crossAxisEndOffset: 0.5,
          );
        }),
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return GestureDetector(
//      onTap: onSignUpComplete,
//      child: DefaultTextStyle(style: Theme.of(context).textTheme.display2,
//          child: Container(
//            color: Colors.amber,
//            alignment: Alignment.center,
//            child: Text('choose detail page'),
//          )),
//    );
//  }


}