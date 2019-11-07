

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'default_localations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations>{
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en','zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }


  static  AppLocalizationsDelegate localizedDelegate = AppLocalizationsDelegate();

}