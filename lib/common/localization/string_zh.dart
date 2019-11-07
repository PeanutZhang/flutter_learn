

import 'package:flutter_app/common/localization/base_string.dart';

class StringZh extends AppStringBase{
 @override
 String welcomemessage = "欢迎来到flutter";

  @override
  String get app_name => "flutter app";



 @override
 String network_error_401 = "[401错误可能: 未授权 \\ 授权登录失败 \\ 登录过期]";
 @override
 String network_error_403 = "403权限错误";
 @override
 String network_error_404 = "404错误";
 @override
 String network_error_timeout = "请求超时";
 @override
 String network_error_unknown = "其他异常";
 @override
 String network_error = "网络错误";
}