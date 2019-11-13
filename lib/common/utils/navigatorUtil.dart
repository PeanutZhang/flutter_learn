import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorUtil {


  //Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget) {
    return MediaQuery(
        ////不受系统字体缩放影响
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .copyWith(textScaleFactor: 1),
        child: widget);
  }

  static void goHome(BuildContext context) {}

  static void goLogin(BuildContext context) {}
}
