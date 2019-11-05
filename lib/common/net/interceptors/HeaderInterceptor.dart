import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper{

  @override
  Future onRequest(RequestOptions options) async{
    // TODO: implement onRequest
    options.sendTimeout = 15000;

    return options;
  }

}