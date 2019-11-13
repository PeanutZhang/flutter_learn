import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/redux/login_redux.dart';
import 'package:flutter_app/redux/middleware/epic_middleware.dart';
import 'package:flutter_app/redux/theme_redux.dart';
import 'package:flutter_app/redux/user_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

import 'locale_redux.dart';
//全局 的store   --》 绑定reducer 和aciton
class AppState {
  User userInfo;
  ThemeData themeData;

  //语言
  Locale locale;

  //默认语言
  Locale platformLocale;

  AppState({this.userInfo, this.themeData,this.locale});
}


///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///自定义了 appReducer 用于创建 store
AppState appReducer(AppState state, action) {
  return AppState(
    ///通过 UserReducer 将 AppState 内的 userInfo 和 action 关联在一起
      userInfo: UserReducer(state.userInfo, action),
      themeData: ThemeReducer(state.themeData,action),
      locale: LocaleReducer(state.locale,action),
  );
}
final List<Middleware<AppState>> middleware = [
  EpicMiddleware<AppState>(UserInfoEpic()),
  EpicMiddleware<AppState>(LoginEpic()),
  UserInfoMiddleware(),
  LoginMiddleware(),
];
