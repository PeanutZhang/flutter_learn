import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

import '../Code.dart';
import '../ResultData.dart';


class ErrorInterceptor extends InterceptorsWrapper{

  final Dio _dio;

  ErrorInterceptor(this._dio);

 @override
  Future onRequest(RequestOptions options) async{
    // TODO: implement onRequest
    var connectActivityResult = await (Connectivity().checkConnectivity());
    if(connectActivityResult == ConnectivityResult.none){
       return _dio.resolve(ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR,"",false),false,Code.NETWORK_ERROR));
    }
   return options;
  }

}