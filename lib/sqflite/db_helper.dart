import 'dart:math';

import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'database_info.dart';

class DBHelper {

  static Database _db;
  
  Future<Database> get db async {
    if(_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DBInfo.DB_NAME);
    var db = await openDatabase(path, version: 6, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(DBInfo.CREATE_TABLE_LOGIN);
    await db.execute(DBInfo.CREATE_TABLE_CUSTOMER);
  }

  Future<dynamic> save(dynamic entity, String table) async{
    var dbClient = await db;
    entity.id = await dbClient.insert(table, entity.toMap());
    return entity;
  }

  Future<dynamic> update(dynamic entity, String table) async{
    var dbClient = await db;
    entity.id = await dbClient.update(table, entity.toMap(), where: 'id = ?', whereArgs: [entity.id]);
    return entity;
  }

  Future<dynamic> saveLogin(Login login) async{
    var dbClient = await db;

    try {
      bool flag = true;

      while (flag) {
        Login preLogin = await getAllFromLogin();
        if (preLogin != null) {
          await delete(preLogin.id, DBInfo.TABLE_LOGIN);
        } else {
          flag = false;
        }
      }

      login.id = await dbClient.insert(DBInfo.TABLE_LOGIN, login.toMap());
      return login;
    } catch(error){
      print(error);
      return null;
    }
  }

  Future<Login> getAllFromLogin() async{
    var dbClient = await db;
    List<Map> maps = await dbClient.query(DBInfo.TABLE_LOGIN, columns: [DBInfo.LOGIN_ID,DBInfo.LOGIN_USERNAME,DBInfo.LOGIN_PASSWORD,DBInfo.LOGIN_IS_REMEMBERED,DBInfo.LOGIN_IS_AUTHENTICATED,DBInfo.LOGIN_ACCESS_TOKEN,DBInfo.LOGIN_VALIDITY], distinct: true);
    Future<Login> login;
    try {
      if (maps.length != 0) {
        login = Future.value(Login.fromMap(maps[0]));
      }
    } catch(error){
      print(error);
    }
    return login;
  }
  
  Future<int> delete(int id, String table) async {
    var dbClient = await db;
    return await dbClient.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}