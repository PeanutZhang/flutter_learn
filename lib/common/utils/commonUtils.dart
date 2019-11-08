


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/localization/base_string.dart';
import 'package:flutter_app/common/localization/default_localations.dart';
import 'package:flutter_app/common/style/app_style.dart';
import 'package:flutter_app/redux/app_state.dart';
import 'package:flutter_app/redux/locale_redux.dart';
import 'package:flutter_app/redux/theme_redux.dart';
import 'package:redux/redux.dart';
class CommonUtils{

  static final double MILLIS_LIMIT = 1000.0;

  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;

  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;

  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;

  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  static Locale currentLocale;

  static getThemeData(Color color){
      return ThemeData(primarySwatch: color,platform: TargetPlatform.android);
  }

  static AppStringBase getLocale(BuildContext context){
    return AppLocalizations.of(context).currentLocalized;
  }

  static changeLocale(Store<AppState> store,int index){
      Locale locale = store.state.locale;
      switch(index){
        case 1:
          locale = Locale('zh','CH');//zh languageCode  CH: countryCode
          break;
        case 2:
          locale = Locale('en','US');
          break;
      }
      currentLocale = locale;
      store.dispatch(LocaleChangeAction(locale));
  }

//刷新主题
  static pushTheme(Store store,int corlorsIndex){
     ThemeData themeData ;
     List colors = getThemeListColor();
     themeData = getThemeData(colors[corlorsIndex]);
     store.dispatch(ThemeRefreshAction(themeData));
  }


  static List<Color> getThemeListColor() {
    return [
      AppColors.primarySwatch,
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }

}