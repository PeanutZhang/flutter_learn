

 import 'package:flutter_app/model/User.dart';
import 'package:flutter_redux/flutter_redux.dart';
 import 'package:redux/redux.dart';


 final UserReducer = combineReducers<User>([TypedReducer<User,UserUpdateAction>(_updateLoaded)]);


class UserUpdateAction{
   final User userInfo;

   UserUpdateAction(this.userInfo);
}

User _updateLoaded(User user,action){
     user = action.userInfo;
     return user;
}