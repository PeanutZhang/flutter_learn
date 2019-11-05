import 'package:dio/dio.dart';

import '../Code.dart';
import '../ResultData.dart';


class ResponseInterceptor extends InterceptorsWrapper{

    @override
  Future onResponse(Response response) async{
    // TODO: implement onResponse
    RequestOptions options = response.request;
    var value;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if(header !=null && header.toString().contains("text")){
            value = ResultData(response.data,true,Code.SUCCESS);
          }else if(response.statusCode >= 200 && response.statusCode < 300){
            value = ResultData(response.data, true, Code.SUCCESS,headers: response.headers);
          }
    } catch (e) {
      print(e.toString() + options.path);
      value = ResultData(response.data, false, response.statusCode,headers: response.headers);
    }
      return value;
  }



}