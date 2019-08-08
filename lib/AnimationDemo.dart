import 'package:flutter/material.dart';
import 'PinterDemmo.dart';
import 'package:flutter/animation.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'the fadeAnimation',
      theme: ThemeData(primaryColor: Colors.blue),
      home: LogoScale(),
    );
  }
}

class LogoScale extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogoScaleState();
  }
}

class LogoScaleState extends State<LogoScale>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curve;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _curve = CurvedAnimation(parent: _controller,);
    animation = Tween(begin: 0.0, end: 300.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
     ..addStatusListener((state){
       print("$state");
       if(state == AnimationStatus.completed){
         _controller.reverse();
       }else if(state == AnimationStatus.dismissed){
         _controller.forward();
       }
     })
    ;
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
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
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
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
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        tooltip: 'Fade',
        child: Icon(Icons.brush),
      ),
    );
  }
}
