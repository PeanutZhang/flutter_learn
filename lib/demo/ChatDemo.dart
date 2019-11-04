import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
class ChatDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ChatScreen(),
    );
  }

}

class ChatScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatState();
  }

}

class ChatState extends State<ChatScreen> with TickerProviderStateMixin{

  TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  Widget _buildTextComposer(){

    return IconTheme(data: IconThemeData(color: Theme.of(context).accentColor), child:
      Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Flexible(child:  TextField(
            controller: _controller,
            onSubmitted: _handleSubmitted,
            decoration: InputDecoration(hintText: 'send a message'),
            style: TextStyle(fontSize: 24),
            onChanged: _textChange,
          ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(icon: Icon(Icons.send), onPressed:()=> _handleSubmitted(_controller.text)),
          )
        ],
      ),
    )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    for(ChatMessage message in _messages){
      message.animationcontroller.dispose();
    }
    super.dispose();
  }


   void _handleSubmitted(String text){
      print(text);
      _controller.clear();
      if(text.length == 0)return;
      ChatMessage message = ChatMessage(text,AnimationController(vsync: this,duration: Duration(microseconds: 1700)),);
      setState(() {
        _messages.insert(0, message);
      });
      message.animationcontroller.forward();
   }


  void _textChange(String value) {
    print('textChange-->   '+value);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('chat demo'),),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                itemBuilder:(c,int index)=>_messages[index],
                itemCount: _messages.length,
                reverse: true,
                padding: EdgeInsets.all(8.0),
            ),
          ),
          Divider(height: 1.0,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          )
        ],
      )
    );
  }



}
const _name = 'zhang hao';
class ChatMessage extends StatelessWidget{

  String text;
  AnimationController animationcontroller;
  ChatMessage(this.text,this.animationcontroller);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizeTransition(sizeFactor:CurvedAnimation(parent: animationcontroller
        , curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        color: Colors.blueGrey,
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(child: Text(_name[0]),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_name,style: Theme.of(context).textTheme.subhead),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}

