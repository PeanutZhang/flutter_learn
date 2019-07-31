import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'RandomWordsState.dart';

void main() => runApp(new ListTileDemo());

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
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
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
