import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/practices/HomePageD1.dart';

import 'AnimatedListDemo.dart';
import 'package:flutter_app/demo/AnimationDemo.dart';
import 'package:flutter_app/demo/AsyncDemo.dart';
import 'BuildUIWidget.dart';
import 'ChatDemo.dart';
import 'package:flutter_app/demo/HeroApp.dart';
import 'package:flutter_app/demo/HomePage.dart';
import 'package:flutter_app/demo/ListLoadMoreDemo.dart';
import 'package:flutter_app/demo/MethodChannelDemo.dart';
import 'package:flutter_app/demo/PickImage.dart';
import 'package:flutter_app/demo/RandomWordsState.dart';
import 'package:flutter_app/demo/SignUpPage.dart';


//void main() => runApp(new MyApp());

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/':(BuildContext c)=> HomePage(),
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
      },
    );
  }
}

//*********************************************
//scaffold demo1  ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//**********************************
class BasicAppbarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BasicAppbarState();
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'Smoke', icon: Icons.smoke_free),
  const Choice(title: 'vpn', icon: Icons.vpn_key)
];

class BasicAppbarState extends State<BasicAppbarDemo> {
  Choice _selectChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'basic appbar',
            style: TextStyle(color: Colors.red),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
              },
            ),
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: () {
                _select(choices[1]);
              },
            ),
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext cxt) {
                return choices.skip(2).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ChoiceCard(
            choice: _selectChoice,
          ),
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  const ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 128,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            )
          ],
        ),
      ),
      elevation: 10,
    );
  }
}

//************                     ************
//&&&&&&&&&&&&   ↑↑↑↑↑↑↑↑↑↑↑↑      ↓↓↓&&&&&&&&&&&&
//**********************************************

//   ****************************
//      *****↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓****
//       ******  tab选项  *****
//         **↓↓↓↓↓↓↓↓↓↓↓***
//             ↓↓↓↓↓↓

class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabBarDemoState();
  }
}

class TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class TabbedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
          length: choices.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text('tabbed bar'),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.deepPurple,
                onTap: (position){
                  print('tab the position--> '+ position.toString());
                },
                tabs: choices.map((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),

                  );
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: choices.map((Choice choice) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ChoiceCard(
                    choice: choice,
                  ),
                );
              }).toList(),
            ),
          )),
    );
  }
}

//          ↑↑↑↑↑↑↑
//      ↑↑↑↑↑ tabbar ↑↑↑↑
//   ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
// **************************
//       **↓↓↓↓↓↓↓↓↓↓↓***
//          BottomNavigationBar
//            ↓↓↓↓↓↓
//

  class BottomNavigationBarDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => BottomNavigationState();

  }

  class BottomNavigationState extends State<BottomNavigationBarDemo>{
     int _seclectIndex = 0;
     static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    static const List<Widget> _widgetOptions = <Widget>[
      Text(
        'index 0 home',
        style: optionStyle,
      ),
      TextField(
        obscureText: true,
        decoration: InputDecoration(border: OutlineInputBorder(),),

      ),
      Text('index 2 School',style: optionStyle,)
     ];

     void _onItemTapped(int index){
       if(_seclectIndex == index)return;
       setState(() {
         _seclectIndex = index;
         print('-----------------------');
       });
     }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('BottomNavigationBar'),),
        body: Center(child: _widgetOptions.elementAt(_seclectIndex),),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('家')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('公司')
            ),
            BottomNavigationBarItem(
                title: Text('学校'),
                icon: Icon(Icons.school)
            )
          ],
          currentIndex: _seclectIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.red,
          elevation: 10,
          iconSize: 28,
          selectedIconTheme: IconThemeData(color: Colors.red,size: 46),
          selectedLabelStyle: TextStyle(color: Colors.yellow),

        ),
      ),
    );
  }

  }

//*******************************************************

 class TextFieldDemo extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Textfield',
      home: TfStateWidget(),
    );
  }


 }

 class TfStateWidget extends StatefulWidget{
   TfStateWidget({Key key}):super(key:key);

   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TfState();
  }


 }

 class TfState extends State<TfStateWidget>{

   final _controller = TextEditingController();
   void initState(){
     _controller.addListener((){
       final text = _controller.text.toLowerCase();
       print(text);
       _controller.value = _controller.value.copyWith(
         text: text,
         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
         composing: TextRange.empty
       );
     });
     super.initState();
   }
   void dispose(){
     _controller.dispose();
     super.dispose();
   }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(6.0),
        alignment: Alignment.center,
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
      ),
    );
  }

 }

 //**************************************
//**************************************

 class ListTileDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyStatelessWidget(),
      title: 'listView',
    );
  }

 }

 class CustomListItem extends StatelessWidget{

  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;


  const CustomListItem({this.thumbnail, this.title, this.user, this.viewCount});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 2,child: thumbnail,),
          Expanded(flex: 3,child: _VideoDescription(
            title: title,user: user,viewCount: viewCount,
          ),),
          const Icon(Icons.more_vert,size: 16.0,)
        ],

      ),
    );
  }

 }
 class _VideoDescription extends StatelessWidget{
   final String title;
   final String user;
   final int viewCount;
   const _VideoDescription({Key key,this.title,this.user,this.viewCount}):super(key: key);


   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14.0,decoration: TextDecoration.none)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(user,style: const TextStyle(fontSize: 10,decoration: null),),
        const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
        Text('$viewCount views',style: TextStyle(fontSize: 10),)
      ],
    ),
    );
  }

 }

 class MyStatelessWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      children: <CustomListItem>[
        CustomListItem(
          user: 'Flutter',
          viewCount: 999000,
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          title: 'The Flutter YouTube Channel',
        ),
        CustomListItem(
          user: 'Dash',
          viewCount: 884000,
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.yellow),
          ),
          title: 'Announcing Flutter 1.0',
        ),
      ],
    );
  }

  MyStatelessWidget({Key key}):super(key:key);

 }



//*****************************************************************************
//*****************************************************************************
//********************** article ui demo **************************************

 class ArticleLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
       home: Scaffold(
         appBar: AppBar(title: Text('listview'),),
         body: ListViewWidget(),
       ),
    );
  }

 }

 class _ArticleDescription extends StatelessWidget{

  final String title;
  final String subtitle;
  final String author;
  final String puishedDate;
  final String readDuration;


  _ArticleDescription({Key key,this.title, this.subtitle, this.author, this.puishedDate,
      this.readDuration}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       Expanded(flex: 2,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$title',
                 maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                Text(
                  '$subtitle',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0,color: Colors.black54),
                )
              ],
           )),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$author',maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight:  FontWeight.bold),),
                const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                Text('$puishedDate · $readDuration ★ ',style: TextStyle(color: Colors.black54,fontSize: 12.0),)
              ],
            ))
      ],
    );
  }

 }

 class ArticleItem extends StatelessWidget{
  final Widget thumnial;
  final String title;
  final String subtitle;
  final String author;
  final String puishedDate;
  final String readDuration;


  ArticleItem({Key key,this.thumnial, this.title, this.subtitle, this.author,
      this.puishedDate, this.readDuration}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(aspectRatio: 1.0,child: thumnial,),
              Expanded(
                child: Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: _ArticleDescription(title:title, subtitle:subtitle, author:author, puishedDate:puishedDate, readDuration:readDuration),
                ),
              )
            ],
          ),
        ),
    );
  }

 }

  class ListViewWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        ArticleItem(
          thumnial: Container(decoration: BoxDecoration(color: Colors.pink),),
          title: 'Flutter 1.0 lanuch',
          subtitle: 'Flutter continues to improve and expand its horizons.'
              'This text should max out at two lines and clip',
          author: 'Zyh',
          puishedDate: 'Aug 01',
          readDuration: '5 mins',
        ),
        ArticleItem(
          thumnial: Container(decoration: BoxDecoration(color: Colors.blue),),
          title: 'Flutter 1.2 release  continual updates to the frame work',
          subtitle: 'Flutter once again improves and make updates',
          author: 'Fultter',
          puishedDate: 'Aug 01',
          readDuration: '10 mins',
        )
      ],
    );
  }

  }




class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

 class FlowApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'flowMenu',
      home: Scaffold(
        appBar: AppBar(title: Text('flowMenu'),),
        body: FlowMenu(),
      ),
    );
  }

 }
 class FlowMenu extends StatefulWidget{
    @override
     FlowMenuState createState()=> FlowMenuState();
 }

 class FlowMenuState extends State<FlowMenu> with SingleTickerProviderStateMixin{
  AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData icon){
    if(icon != Icons.menu) setState(()=> lastTapped = icon);
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(duration: const Duration(milliseconds: 250),vsync: this);
  }

  Widget flowMenuItem(IconData icon){
    final double buttonDiameter  = MediaQuery.of(context).size.width / menuItems.length-10;
    return Padding(padding: const EdgeInsets.all(5.0),
      child: RawMaterialButton(
          fillColor: lastTapped == icon ? Colors.amber[700]:Colors.blue,
          splashColor: Colors.amber[100],
          shape: CircleBorder(),
          constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
          onPressed: (){
            _updateMenu(icon);
            menuAnimation.status == AnimationStatus.completed?menuAnimation.reverse():menuAnimation.forward();
          },
        child: Icon(icon,
        color: Colors.white,size: 36,),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Flow(delegate: FlowMenuDelegate(menuAnimation: menuAnimation),children:
        menuItems.map<Widget>((IconData icon)=>flowMenuItem(icon)).toList(),
      ),
    );
  }

 }
 class FlowMenuDelegate extends FlowDelegate{

   FlowMenuDelegate({this.menuAnimation}) : super(repaint: menuAnimation);

   final Animation<double> menuAnimation;


  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    double dx = 0.0;
    for(int i =0;i< context.childCount;++i){
      dx = context.getChildSize(i).width *i;
      context.paintChild(i,
      transform: Matrix4.translationValues(dx * menuAnimation.value,0,0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return menuAnimation!= oldDelegate.menuAnimation;
  }

 }

 class Spinner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpinnerState();
  }



 }

 class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin{

  AnimationController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState---------');
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 10),)..repeat();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose----');
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: _controller,
      child: Container(width: 200,height: 200,color: Colors.blue,),
      builder: (BuildContext context,Widget child) => Transform.rotate(angle: _controller.value * 2.0 ,child: child,),
    );
  }


 }
