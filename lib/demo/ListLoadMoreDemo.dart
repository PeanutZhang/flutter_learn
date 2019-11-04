
import 'package:flutter/material.dart';
import 'package:async/async.dart';

class ListLoadMoreDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListLoadMoreState();
  }

}

class ListLoadMoreState extends State<ListLoadMoreDemo>{

  List<int> _items = List.generate(20, (index)=> index);
  ScrollController _controller = ScrollController();
  bool isPerformingRequest = false;





  Future<List<int>> _fakeRequest(int from,int to) async{
    return Future.delayed(Duration(seconds: 2),(){
      return List.generate(to - from, (i)=> i+from);
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(itemBuilder: (context,index){
          if(index == _items.length -1){
            return _buildProgressIndicator();
          }else{
            return  Column(
              children: <Widget>[
                Container(
                  child: Text("Number $index",style: TextStyle(color: Colors.red,fontSize: 20),),
                  alignment: Alignment.center,
                ),
                Divider(color: Colors.black,)
              ],
            );
          }
        },
          itemCount: _items.length,
          controller: _controller,
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(){
    return Padding(padding: EdgeInsets.all(15.0),
    child: Center(
      child: Opacity(opacity: isPerformingRequest?1:0,
      child: CircularProgressIndicator(),),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _controller.addListener((){
     if(_controller.position.pixels == _controller.position.maxScrollExtent){
         _getMoreData();
     }
   });

  }


  @override
   void dispose(){
    _controller.dispose();
    super.dispose();
   }


  _getMoreData() async {
      if(!isPerformingRequest){
        setState(() {
          isPerformingRequest = true;
        });
      List<int> data=  await  _fakeRequest(_items.length,_items.length+ 10);
      data.clear();
      if(data.isEmpty){
        double edg = 50.0;
        double offset = _controller.position.maxScrollExtent - _controller.position.pixels;
        if(offset < edg){
          _controller.animateTo(_controller.offset-(edg -offset), duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        }
      }

      setState(() {
        _items.addAll(data);
        isPerformingRequest = false;
      });
      }
  }

}
