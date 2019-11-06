import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/welcomePage.dart';
import 'package:flutter_app/page/homePage.dart';
import 'package:flutter_app/practices/HomePageD1.dart';
import 'package:flutter_app/redux/app_state.dart';

import 'common/style/app_style.dart';
import 'common/utils/commonUtils.dart';
import 'demo/AnimatedListDemo.dart';
import 'demo/AnimationDemo.dart';
import 'demo/AsyncDemo.dart';
import 'demo/BuildUIWidget.dart';
import 'demo/ChatDemo.dart';
import 'demo/HeroApp.dart';
import 'demo/HomePage.dart';
import 'demo/ListLoadMoreDemo.dart';
import 'demo/MethodChannelDemo.dart';
import 'demo/PickImage.dart';
import 'demo/SignUpPage.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'model/User.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(initialRoute: '/', routes: {
      '/': (BuildContext c) => HomePageT(),
      '/signup': (BuildContext c) => SignUpPage(),
      '/buildUi': (BuildContext c) => BuildUIWidget(),
      '/anidemo': (BuildContext c) => AnimationDemo(),
      '/asyncdemo': (BuildContext c) => AsyncDemo(),
      '/pickImg': (BuildContext c) => PickImage(),
      '/chat': (BuildContext c) => ChatDemo(),
      '/animatedList': (BuildContext c) => AnimatedListDemo(),
      '/heropage': (BuildContext c) => HeroApp(),
      '/methodchannel': (BuildContext c) => MethodChannelDemo(),
      '/listV': (BuildContext c) => ListLoadMoreDemo(),
      '/listC': (BuildContext c) => HomePageD1(),
    });
  }
}

class FlutterReduxApp extends StatelessWidget {
  final store = Store<AppState>(appReducer,
      initialState: AppState(
        userInfo: User.empty(),
        themeData: CommonUtils.getThemeData(AppColors.primarySwatch),
      ));

  FlutterReduxApp({Key: Key}) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider(store: store,
                 child: StoreBuilder(builder: (context,store){
                    return MaterialApp(
                      //動態改變主題顔色
                      theme: store.state.themeData,
                       routes: {
                        WelcomePage.rName:(context){
                          return WelcomePage();
                        },
                         HomePage.rName:(context){
                          return HomePage();
                         }
                       },
                    );
                 }));
  }
}

class ReduxAppDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<AppState, User>(
      converter: (store) => store.state.userInfo,
      builder: (context, userinfo) {
        return Text(
          userinfo.name,
          style: Theme.of(context).textTheme.display1,
        );
      },
    );
  }
}
