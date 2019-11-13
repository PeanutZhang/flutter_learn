
import 'package:flutter_app/common/utils/commonUtils.dart';
import 'package:flutter_app/common/utils/navigatorUtil.dart';
import 'package:flutter_app/dao/user_dao.dart';
import 'package:flutter_app/db/sql_manager.dart';
import 'package:flutter_app/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'middleware/epic.dart';
import 'middleware/epic_store.dart';




final LoginReducer = combineReducers([]);







class LoginAction{
  final BuildContext context;
  final String username;
  final String password;

  LoginAction(this.context, this.username, this.password);

}

class LoginSuccessAction{
  final BuildContext context;
  final bool success;

  LoginSuccessAction(this.context, this.success);

}

class LogoutAction{
  final BuildContext context;

  LogoutAction(this.context);
}

bool _loginResult(bool result,LoginSuccessAction action){
    if(action.success == true){
        NavigatorUtil.goHome(action.context);
    }
    return action.success;
}
bool _logoutResult(bool result ,LogoutAction action){
  return true;
}


class LoginMiddleware implements MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is LogoutAction) {
      UserDao.clearAll(store);
      SqlManager.close();
      NavigatorUtil.goLogin(action.context);
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}

class LoginEpic implements EpicClass<AppState> {
  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return Observable(actions)
        .whereType<LoginAction>()
        .switchMap((action) => _loginIn(action, store))
        .debounce(
        ((result) => TimerStream(result, const Duration(seconds: 1))));
  }


  Stream<dynamic> _loginIn(
      LoginAction action, EpicStore<AppState> store) async* {
    CommonUtils.showLoadingDialog(action.context);
    var res = await UserDao.login(
        action.username.trim(), action.password.trim(), store);
    Navigator.pop(action.context);
    yield LoginSuccessAction(action.context, (res != null && res.result));
  }
}






