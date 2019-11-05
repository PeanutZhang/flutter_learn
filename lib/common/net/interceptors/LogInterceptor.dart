

import 'package:dio/dio.dart';
import 'package:flutter_app/common/config/config.dart';

class LogInterceptors extends InterceptorsWrapper{

  @override
  Future onRequest(RequestOptions options) async{
    // TODO: implement onRequest
     if(Config.Debug){
       print("请求url: ${options.path}");
       print("请求头： ${options.headers.toString()}");
      if(options.data !=null){
        print("请求参数： ${options.data.toString()}");
      }
     }
    return options;
  }

  @override
  Future onResponse(Response response) async{
    // TODO: implement onResponse
    if(Config.Debug){

         if(response !=null){
           print("返回结果： ${response.toString()}");
         }
    }
    return response;
  }
  @override
  Future onError(DioError err) async{
    // TODO: implement onError
    if(Config.Debug){
     print("请求异常： ${err.toString()}");
     print("请求异常信息："+err.response?.toString() ?? "");
    }
    return err;
  }

}