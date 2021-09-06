import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class DBHelper {

  var db;

  String colId = 'id';
  String colName = 'name';
  String colPhone = 'publicPhone';
  String colPerson = 'personPhone';
  String colMail = 'mail';

  //GetUser
  Future<List> getUserData() async {
    var response = await http.get(Uri.parse("172.16.2.106:8080/api/friend"));
    return json.decode(response.body);
  }

  //AddUser - CRUD
  Future<http.Response> addUser(String name, String phone,
      String email) async {
    var url = Uri.parse("172.16.2.106:8080/api/friend");
    Map data = {
      'name':  '$name',
      'phone': '$phone',
      'email': '$email',
    };
    // encode Map to Json
    var body = json.encode(data);

    var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    // print(object);
    print("{$response.body}"); //t/f를 받음
    return
      response;
  }

  // update or put
  Future<http.Response> updateUserData(String id, String name,
      String email, String phone) async {
    int a = int.parse(id);
    print(e);
    var url = Uri.parse("172.16.2.106:8080/api/friend");

    Map data = {
      'id' : '$a',
      'name': '$name',
      'email': '$email',
      'phone': '$phone',
    };
    //encode to Json
    var body = json.encode(data);

    var response = await http.put(url,
    headers : {"Content-Type" : "application/json"}, body:body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //delete
  Future<http.Response> deleteUserData(String id) async {
    int a = int.parse(id);
    print(e);
    var url = Uri.parse("172.16.2.106:8080/api/friend");
    var response =
    await http.delete(url, headers: {"content-Type" : "application/json"});
    print("${response.statusCode}");
    return response;
    }



    // //get user data -> add page와 연결
    // Future<List> getUserData() async {
    //   final response = await http.get("url");
    //   return json.decode(response.body);
    // }
  }