import 'package:dio/dio.dart';
import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';

class TokenInterceptors extends InterceptorsWrapper{

  String _token;

  @override
  Future onRequest(RequestOptions options) async{
    // TODO: implement onRequest
   if(_token == null){
     var authorizationCode = await getAuthorization();
      if(authorizationCode !=null){
         _token = authorizationCode;
      }
   }
    options.headers["Authorization"] = _token;
    return options;
  }

  @override
  Future onResponse(Response response) async{
    // TODO: implement onResponse
    try {
      var responseJson =  response.data;
      if(response.statusCode == 201 && responseJson["token"] !=null){
            _token ="token"+responseJson["token"];
           await  LocalStorage.save(Config.TOKEN_KEY, _token);
          }
    } catch (e) {
      print(e);
    }
    return response;

  }

//清除授权
  clearAuthorization(){
    this._token = null;
    LocalStorage.remove(Config.TOKEN_KEY);
  }

 getAuthorization() async{
   String token = await LocalStorage.get(Config.TOKEN_KEY);
   if(token == null){
     String basic = await LocalStorage.get(Config.USER_BASIC_CODE);
     if(basic == null){
       //提示输入密码账号
     }else{
       return 'basic $basic';//通过basic 去获取token
     }
   }else{
     this._token = token;
     return token;
   }
 }

}