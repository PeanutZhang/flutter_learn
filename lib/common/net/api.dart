import 'package:dio/dio.dart';
import 'dart:collection';

import 'Code.dart';
import 'ResultData.dart';
import 'interceptors/ErrorInterceptor.dart';
import 'interceptors/HeaderInterceptor.dart';
import 'interceptors/ResponseInterceptor.dart';
import 'interceptors/TokenInterceptor.dart';

class HttpManger{

 static const CONTENT_TYPE_JSON = "application/json";
 static const CONTENT_TYPE_FORM="application/x-www.from-urlencoded";

 Dio _dio = Dio();
 TokenInterceptors _tokenInterceptors = TokenInterceptors();
 HttpManger() {
   _dio.interceptors.add(HeaderInterceptor());
   _dio.interceptors.add(_tokenInterceptors);
   _dio.interceptors.add(LogInterceptor());
   _dio.interceptors.add(ErrorInterceptor(_dio));
   _dio.interceptors.add(ResponseInterceptor());

 }

 // url 请求url params 请求参数
 // header 请求头
 // option 请求配置
 //网络请求
 Future<ResultData> netFetch(url,params,Map<String,dynamic> header,Options options, {noTip = false}) async{


   Map<String,dynamic> headers = HashMap();
   if(header !=null){
     headers.addAll(header);
   }
   if(options !=null){
     options.headers = headers;
   }else{
     options = Options(method: "get");
     options.headers = headers;
   }
   requestError(DioError e){
     Response responseError;
     if(e.response !=null){
       responseError = e.response;
     }else {
       responseError = Response(statusCode: 666);
     }
    if(e.type == DioErrorType.SEND_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT){
       responseError.statusCode = Code.NETWORK_TIMEOUT;
    }
    return ResultData(Code.errorHandleFunction(responseError.statusCode, e.message, noTip),false,responseError.statusCode);
   }

   Response response;
   try {
     response =  await _dio.request(url,data: params,options: options);
   } on DioError catch (e) {
     print(e);
     return requestError(e);
   }
   if(response.data is DioError){
    return  requestError(response.data);
   }
   return response.data;
 }

  clearAuthorization(){
   _tokenInterceptors.clearAuthorization();
  }

 getAuthorization() async{
   return _tokenInterceptors.getAuthorization();
 }
}

final HttpManger httpManager = HttpManger();
