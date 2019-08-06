import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'the fadeAnimation',
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyFadeTest(),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyFadeState();
  }
}

class MyFadeState extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FadeAnimation'),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
              opacity: _curvedAnimation,
              child: FlutterLogo(size: 100,),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _controller.forward();
      },
      tooltip: 'Fade',
        child: Icon(Icons.brush),
      ),
    );
  }
}
