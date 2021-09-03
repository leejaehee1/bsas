import 'dart:convert';
import 'dart:io';
import 'package:bsas/model/data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class DatabaseHelper{
  // static final DatabaseHelper instance = DatabaseHelper._instance();
  var _db;
  // final String Url = ""; or String Url = "";


  String userDataTable = 'user_data_table';
  String hospitalDataTable = 'hospital_data_table';
  String centerDataTable = 'center_data_table';
  String colId = 'id';
  String colName = 'name';
  String colPhone = 'publicPhone';
  String colPerson = 'personPhone';
  String colMail = 'mail';


  Future<Database> get db async{
    if(_db == null){
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'enroll_data_list.db';
    final dataListDB = await openDatabase(path, version: 1, onCreate: _createDb);
    return dataListDB;

  }
  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $userDataTable('
            '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$colName TEXT, '
            '$colPhone TEXT, '
            '$colMail TEXT )'
    );
    await db.execute(
        'CREATE TABLE $hospitalDataTable('
            '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$colName TEXT, '
            '$colPhone TEXT, '
            '$colPerson TEXT, '
            '$colMail TEXT )'
    );
    await db.execute(
        'CREATE TABLE $centerDataTable('
            '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$colName TEXT, '
            '$colPhone TEXT, '
            '$colPerson TEXT, '
            '$colMail TEXT )'
    );
  }

// 모든 Data를 가져오는 방법

  Future<List> getUserData() async {
    Database db = await this.db;
    var result = await db.query(userDataTable);
    //return result;
    return List.generate(result.length, (i) {
      return Data.fromJson(result[i]);
    });
  }
  Future<List> getHospitalData() async {
    Database db = await this.db;
    var result = await db.query(hospitalDataTable);
    //return result;
    return List.generate(result.length, (i) {
      return Data.fromJson(result[i]);
    });
  }
  Future<List> getCenterData() async {
    Database db = await this.db;
    var result = await db.query(centerDataTable);
    //return result;
    return List.generate(result.length, (i) {
      return Data.fromJson(result[i]);
    });
  }




//<insert>
  Future<int> insertUserData(Data data) async{
    Database db = await this.db;
    final int result = await db.insert(
      userDataTable,
      data.toJson(),
      // where: '$colId = ?',
      // whereArgs: [data.id],
    );
    return result;
  }
  Future<int> insertHospitalData(Data data) async{
    Database db = await this.db;
    final int result = await db.insert(
      hospitalDataTable,
      data.toJson(),
      // where: '$colId = ?',
      // whereArgs: [data.id],
    );
    return result;
  }
  Future<int> insertCenterData(Data data) async{
    Database db = await this.db;
    final int result = await db.insert(
      centerDataTable,
      data.toJson(),
      // where: '$colId = ?',
      // whereArgs: [data.id],
    );
    return result;
  }


  //<update>
  Future<int> updateUserData(Data data) async{
    Database db = await this.db;
    final int result = await db.update(
      userDataTable,
      data.toJson(),
      where: '$colId = ?',
      whereArgs: [data.id],
    );
    return result;
  }
  Future<int> updateHospitalData(Data data) async{
    Database db = await this.db;
    final int result = await db.update(
      hospitalDataTable,
      data.toJson(),
      where: '$colId = ?',
      whereArgs: [data.id],
    );
    return result;
  }
  Future<int> updateCenterData(Data data) async{
    Database db = await this.db;
    final int result = await db.update(
      centerDataTable,
      data.toJson(),
      where: '$colId = ?',
      whereArgs: [data.id],
    );
    return result;
  }


  //<delete>
  Future<int> deleteUserData(int id) async{
    Database db = await this.db;
    final int result = await db.delete(
      userDataTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }
  Future<int> deleteHospitalData(int id) async{
    Database db = await this.db;
    final int result = await db.delete(
      hospitalDataTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }
  Future<int> deleteCenterData(int id) async{
    Database db = await this.db;
    final int result = await db.delete(
      centerDataTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }



}