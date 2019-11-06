

 import 'package:flutter_app/db/sql_manager.dart';
import 'package:sqflite/sqflite.dart';
 import 'package:meta/meta.dart';

 abstract class BaseDbProvider{

    bool isTabExits = false;
    tableName();
    tableSqlString();

    tableBaseString(String name,String columnId){
         return '''
                   create table $name ($columnId interger primary key autoincrement, 
         ''';
    }

   Future<Database> getDatabase() async {
      return await open();
   }

   @mustCallSuper
   preare(name,String createSql) async{
     isTabExits = await SqlManager.isTableExits(name);
     if(!isTabExits){
          Database db = await  SqlManager.getCurrentDatabase();
         return await db.execute(createSql);
     }
   }

   @mustCallSuper
   open() async{
     if(!isTabExits){
        await preare(tableName(), tableSqlString());
     }
     return SqlManager.getCurrentDatabase();


   }

 }