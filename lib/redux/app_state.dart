import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/redux/theme_redux.dart';
import 'package:flutter_app/redux/user_redux.dart';
import 'package:flutter/material.dart';

class AppState {
  User userInfo;
  ThemeData themeData;

  AppState({this.userInfo, this.themeData});
}


///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///自定义了 appReducer 用于创建 store
AppState appReducer(AppState state, action) {
  return AppState(
    ///通过 UserReducer 将 GSYState 内的 userInfo 和 action 关联在一起
      userInfo: UserReducer(state.userInfo, action),
      themeData: ThemeReducer(state.themeData,action)
  );
}
