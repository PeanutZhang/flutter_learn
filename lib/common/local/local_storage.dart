import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

 static save(String key,value) async{
    SharedPreferences spfers = await SharedPreferences.getInstance();
    spfers.setString(key, value);
 }

 static get(String key) async {
    SharedPreferences spfers = await SharedPreferences.getInstance();
    return spfers.get(key);
 }

 static remove(String key) async {
     SharedPreferences spfers = await SharedPreferences.getInstance();
     spfers.remove(key);
 }

}