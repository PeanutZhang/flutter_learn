

import 'dart:convert';
class CodeUtils {
  static List<dynamic> decodeListResult(String data){
      return json.decode(data);
  }

 static Map<String,dynamic> decodeMapResult(String data){
    return json.decode(data);
 }

static String encondeToString(String data){
    return json.encode(data);
}

}