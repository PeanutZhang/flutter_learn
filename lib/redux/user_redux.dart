

 import 'package:flutter_app/dao/user_dao.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/redux/app_state.dart';
import 'package:flutter_app/redux/middleware/epic.dart';
import 'package:flutter_app/redux/middleware/epic_store.dart';
import 'package:flutter_redux/flutter_redux.dart';
 import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';


 final UserReducer = combineReducers<User>([TypedReducer<User,UserUpdateAction>(_updateLoaded)]);


class UserUpdateAction{
   final User userInfo;

   UserUpdateAction(this.userInfo);
}

User _updateLoaded(User user,action){
     user = action.userInfo;
     return user;
}


 class FetchUserAction {
 }


 class UserInfoMiddleware implements MiddlewareClass<AppState> {

   @override
   void call(Store<AppState> store, dynamic action, NextDispatcher next) {
     if (action is UserUpdateAction) {
       print("*********** UserInfoMiddleware *********** ");
     }
     // Make sure to forward actions to the next middleware in the chain!
     next(action);
   }
 }


 class UserInfoEpic implements EpicClass<AppState> {
   @override
   Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
     return Observable(actions)
     // to UpdateUserAction actions
         .whereType<FetchUserAction>()
     // Don't start  until the 10ms
         .debounce(((_) => TimerStream(true, const Duration(milliseconds: 10))))
         .switchMap((action) => _loadUserInfo());
   }

   // Use the async* function to make easier
   Stream<dynamic> _loadUserInfo() async* {
     print("*********** userInfoEpic _loadUserInfo ***********");
     var res = await UserDao.getUserInfo(null);
     yield UserUpdateAction(res.data);
   }
 }