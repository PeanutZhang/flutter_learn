import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/welcomePage.dart';
import 'package:flutter_app/page/homePage.dart';
import 'package:flutter_app/practices/HomePageD1.dart';
import 'package:flutter_app/redux/app_state.dart';
import 'package:flutter_app/common/event/index.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/event/http_error_event.dart';
import 'common/localization/localizations_delegate.dart';
import 'common/net/Code.dart';
import 'common/style/app_style.dart';
import 'common/utils/commonUtils.dart';
import 'common/utils/navigatorUtil.dart';
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
  runApp(FlutterReduxApp());
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
          locale: Locale('zh', 'CH')
      ));

  FlutterReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider<AppState>(
        store: store,
        child: StoreBuilder<AppState>(builder: (context, store) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizationsDelegate.localizedDelegate
            ],
            locale: store.state.locale,
            supportedLocales: [store.state.locale],
            theme: store.state.themeData,

            routes: {
              WelcomePage.rName: (context) {
                store.state.platformLocale = WidgetsBinding.instance.window.locale;
                return AppLocalizations(child:NavigatorUtil.pageContainer(WelcomePage()));
              },
              HomePage.rName: (context) {
                return AppLocalizations(child: NavigatorUtil.pageContainer(HomePage()));
              }
            },
          );
        })
    );
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
          style: Theme
              .of(context)
              .textTheme
              .display1,
        );
      },
    );
  }
}

class AppLocalizations extends StatefulWidget {
  Widget child;
  AppLocalizations({Key key, this.child}) : super (key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppLocalizationState();
  }

}

class AppLocalizationState extends State<AppLocalizations> {

  StreamSubscription stream;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreBuilder<AppState>(builder: (context, store) {
      //通过storebuilder 实现多语言切换
      return Localizations.override(context: context,
        locale:store.state.locale,
        child: widget.child,
      );
    });
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stream = eventBus.on<HttpErrorEvent>().listen((event){
         errorHandleFunction(event.code,event.message);
    });
  }

  @override
  void dispose(){
   super.dispose();
if(stream !=null){
  stream.cancel();
  stream = null;
}
  }

  ///网络错误提醒
  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error);
        break;
      case 401:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_401);
        break;
      case 403:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_403);
        break;
      case 404:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_404);
        break;
      case Code.NETWORK_TIMEOUT:
      //超时
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_timeout);
        break;
      default:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_unknown +
                " " +
                message);
        break;
    }
  }

}


