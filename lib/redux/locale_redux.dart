

import 'dart:ui';

import 'package:redux/redux.dart';

 //
 // Redux
 //
 final LocaleReducer = combineReducers<Locale>([TypedReducer<Locale,LocaleChangeAction>(_change)]);
 class LocaleChangeAction{
  Locale locale;
  LocaleChangeAction(this.locale);
 }
 Locale _change(Locale locale,action){
   locale = action.locale;
   return locale;
 }