
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/localization/base_string.dart';
import 'package:flutter_app/common/localization/string_en.dart';
import 'package:flutter_app/common/localization/string_zh.dart';

//多语言实现
class AppLocalizations {

  final Locale locale;

  AppLocalizations(this.locale);

   static Map<String,AppStringBase> _localizedValues = {'zh':StringZh(),'ch':StringEn()};


   AppStringBase  get currentLocalized {
     if(_localizedValues.containsKey(locale.languageCode))
     return  _localizedValues[locale.languageCode];
     return _localizedValues['zh'];
   }

   static AppLocalizations of(BuildContext context){
     return Localizations.of(context, AppLocalizations);
   }

}