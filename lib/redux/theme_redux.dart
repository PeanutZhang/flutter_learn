

import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

 final ThemeReducer = combineReducers<ThemeData>([TypedReducer<ThemeData,ThemeRefreshAction>(_refresh)]);

 class ThemeRefreshAction{
  final ThemeData themeData;
   ThemeRefreshAction(this.themeData);
 }
 ThemeData  _refresh(ThemeData themeData,action){
   themeData = action.themeData;
   return themeData;
 }
