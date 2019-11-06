


import 'dart:convert';

import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';
import 'package:flutter_app/model/User.dart';

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

}