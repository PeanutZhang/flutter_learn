import 'package:flutter/material.dart';
import 'package:flutter_app/widget/ZyhTabBarWidget.dart';

class TabBarPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}


 class TabBarPageState extends State<StatefulWidget>{

  final PageController pageController = PageController();
  final List<String> tab = ["趋势","动态","我的"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ZyhTabBarWidget(
      type: ZyhTabBarWidget.BOTTOM_TAB,
      tabItems: _renderTab(),
      tabViews:createPages(),
      backgroundColor: Colors.black,
      indicatorColor: Colors.white,
      title:Text("githubFlutter"),
    );
  }

   List<Widget> _renderTab(){

    List<Widget> tabs = List();
    for(int i = 0; i<tab.length;i++){
      FlatButton flatButton = FlatButton(onPressed: (){

      }, child: Text(tab[i],maxLines: 1,));
       tabs.add(flatButton);
    }
    return tabs;
  }
  createPages(){
    return [];
  }


 }