
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//上下刷新控件
 class ZyhPullLoadWidget extends StatefulWidget {

final IndexedWidgetBuilder itemBuilder;
final RefreshCallback onLoadMore;
final RefreshCallback onRefresh;
final ZyhPullLoadWidgetControl control;
final Key refreshKey;


ZyhPullLoadWidget(this.itemBuilder, this.onLoadMore, this.onRefresh,
    this.control, {this.refreshKey});

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ZyhPullLoadState(itemBuilder,onLoadMore,onRefresh,refreshKey,control);
  }

}

class _ZyhPullLoadState extends State<ZyhPullLoadWidget>{


  final IndexedWidgetBuilder itemBuilder;
  final RefreshCallback onLoadMore;
  final RefreshCallback onRefresh;
  final Key refreshKey;
  ZyhPullLoadWidgetControl control;


  _ZyhPullLoadState(this.itemBuilder, this.onLoadMore, this.onRefresh,
      this.refreshKey, this.control);


 final ScrollController _scrollController = ScrollController();
 @override
  void initState() {
    // TODO: implement initState
   this.control.needLoadMore?.addListener((){
      Future.delayed(Duration(seconds: 2),(){
       _scrollController.notifyListeners();
      });
   });
   _scrollController.addListener((){
     if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
       if(control.needLoadMore.value){
            this.onLoadMore?.call();
       }
     }
   });
   super.initState();
 }

   //根据配置状态返回实际列表数量
   //
  _getListCount(){

   if(control.needHeader){
     //根据是否有头布局 返回实际列表数量
     return (control.dataList.length > 0 ) ? control.dataList.length +2 : control.dataList.length+1;
   }else{//无头布局时
      if(control.dataList.length == 0)return 1;
      return control.dataList.length + 1;
   }
   }

   //根据index 和状态返回实际渲染的item
   _getItem(int index){
       if(!control.needHeader && index == control.dataList.length && control.dataList.length !=0){
         return _buildProgressIndicator();//返回加载更多item
       }else if(control.needHeader && index ==  _getListCount() - 1 && control.dataList.length != 0){
         return _buildProgressIndicator();
       }else if(!control.needHeader && control.dataList.length == 0){
         return _buildEmpty();
       }else{
         return itemBuilder(context,index);
       }
   }

   _buildProgressIndicator(){
      Widget bottomWidget = (control.needLoadMore.value) ?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitRotatingCircle(color: Theme.of(context).primaryColor,),
          Container(width: 5.0,),
          Text("",style: TextStyle(color: Color(0xff121917),fontSize: 14.0,fontWeight: FontWeight.bold),)
        ],
      )
       : Container();
      return Padding(padding: EdgeInsets.all(15.0),child: Center(child: bottomWidget,),);
   }
   _buildEmpty(){
      return Container(
        height: MediaQuery.of(context).size.height -100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Image(image: AssetImage("assetImgName"),width: 70,height: 70,),
            ),
            Container(child: Text("无数据",style: TextStyle(fontSize: 18.0,color: Colors.grey),),)
          ],
        ),
      );
   }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(
        key: refreshKey,
        child: ListView.builder(
            itemCount: _getListCount(),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder:(context,index)=>_getItem(index),
            controller: _scrollController,
        ),
        onRefresh: onRefresh);
  }
}


class ZyhPullLoadWidgetControl{
List dataList = List();
//是否需要加载更多
ValueNotifier<bool> needLoadMore = ValueNotifier(false);
bool needHeader = false;
}
