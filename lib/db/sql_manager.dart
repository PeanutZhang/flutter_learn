

 import 'dart:io';

import 'package:flutter_app/dao/user_dao.dart';
import 'package:flutter_app/model/User.dart';
import 'package:sqflite/sqflite.dart';

class SqlManager{

  static const String _Name="zyh_flutter.db";
  static const int VERSION = 1;
  static Database _database;

  static init() async{

   var databasePath= await getDatabasesPath();
   var userRes = UserDao.getUserInfoLocal();
   String dbName = _Name;
   if(userRes !=null && userRes.result){
     User user =userRes.data;
     if(user !=null && user.login !=null){
       dbName = user.login+"_"+_Name;
     }
   }
   String path = databasePath + dbName;
    if(Platform.isIOS){
      path =databasePath + "/" +dbName;
    }
    _database = await openDatabase(path,version: VERSION,onCreate: (Database db,int version) async {});
  }

  /**
   * 表是否存在
   */
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _database.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database;
  }

  ///关闭
  static close() {
    _database?.close();
    _database = null;
  }

}