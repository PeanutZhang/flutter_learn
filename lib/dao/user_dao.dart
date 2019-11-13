


import 'dart:convert';

import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';
import 'package:flutter_app/common/net/address.dart';
import 'package:flutter_app/common/net/api.dart';
import 'package:flutter_app/common/utils/commonUtils.dart';
import 'package:flutter_app/db/provider/user/userinfo_db_provider.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/redux/app_state.dart';
import 'package:flutter_app/redux/locale_redux.dart';
import 'package:flutter_app/redux/middleware/epic_store.dart';
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

  ///获取用户详细信息
  static getUserInfo(userName, {needDb = false}) async {
    UserInfoDbProvider provider = new UserInfoDbProvider();
    next() async {
      var res;
      if (userName == null) {
        res = await httpManager.netFetch(
            Address.getMyUserInfo(), null, null, null);
      } else {
        res = await httpManager.netFetch(
            Address.getUserInfo(userName), null, null, null);
      }
      if (res != null && res.result) {
        String starred = "---";
        if (res.data["type"] != "Organization") {
          var countRes = await getUserStaredCountNet(res.data["login"]);
          if (countRes.result) {
            starred = countRes.data;
          }
        }
        User user = User.fromJson(res.data);
        user.starred = starred;
        if (userName == null) {
          LocalStorage.save(Config.USER_INFO, json.encode(user.toJson()));
        } else {
          if (needDb) {
            provider.insert(userName, json.encode(user.toJson()));
          }
        }
        return new DataResult(user, true);
      } else {
        return new DataResult(res.data, false);
      }
    }

    if (needDb) {
      User user = await provider.getUserInfo(userName);
      if (user == null) {
        return await next();
      }
      DataResult dataResult = new DataResult(user, true, next: next);
      return dataResult;
    }
    return await next();
  }

  /**
   * 在header中提起stared count
   */
  static getUserStaredCountNet(userName) async {
    String url = Address.userStar(userName, null) + "&per_page=1";
    var res = await httpManager.netFetch(url, null, null, null);
    if (res != null && res.result && res.headers != null) {
      try {
        List<String> link = res.headers['link'];
        if (link != null) {
          int indexStart = link[0].lastIndexOf("page=") + 5;
          int indexEnd = link[0].lastIndexOf(">");
          if (indexStart >= 0 && indexEnd >= 0) {
            String count = link[0].substring(indexStart, indexEnd);
            return new DataResult(count, true);
          }
        }
      } catch (e) {
        print(e);
      }
    }
    return new DataResult(null, false);
  }

  static login(String trim, String trim2, EpicStore<AppState> store) {}

  static void clearAll(Store<AppState> store) {}


}