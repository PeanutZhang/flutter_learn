


import 'dart:convert';

import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';
import 'package:flutter_app/common/utils/commonUtils.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/redux/locale_redux.dart';
import 'package:flutter_app/redux/user_redux.dart';
import 'package:redux/redux.dart';
import 'dao_result.dart';

class UserDao {



  ///获取本地登录用户信息
  static getUserInfoLocal() async {
    var userText = await LocalStorage.get(Config.USER_INFO);
    if (userText != null) {
      var userMap = json.decode(userText);
      User user = User.fromJson(userMap);
      return new DataResult(user, true);
    } else {
      return new DataResult(null, false);
    }
  }

 static initUserInfo(Store store) async {

    var token = await LocalStorage.get(Config.TOKEN_KEY);
    var res = await getUserInfoLocal();
  if(res !=null && res.result !=null && token !=null){
    store.dispatch(UserUpdateAction(res.data));
  }

  //切换主题

   String themeIndex = await LocalStorage.get(Config.THEME_COLOR);
   if(themeIndex !=null &&  themeIndex.length !=0){
     CommonUtils.pushTheme(store,int.parse(themeIndex));
   }

   //切换语言
  String localeIndex = await LocalStorage.get(Config.LOCALE);

   if(localeIndex !=null && localeIndex !=null){
     CommonUtils.changeLocale(store, int.parse(localeIndex));
   }else{
     CommonUtils.currentLocale = store.state.platformLocale;
     store.dispatch(LocaleChangeAction(store.state.platformLocale));
   }
   return DataResult(res.data, (res.result && token !=null));
 }

}