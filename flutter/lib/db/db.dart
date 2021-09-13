import 'dart:convert';
import 'dart:math';
import 'package:bsas/model/data_model.dart';
import 'package:bsas/model/user_model.dart';
import 'package:http/http.dart' as http;

class DBHelper {

  // Future<List> getData() async {
  //   final response = await http.get(Uri.parse("http://localhost:18080/api/users"));
  //
  //   if (response.statusCode == 200) {
  //     var responseJson = json.decode(response.body);
  //     return responseJson;
  //   } else {
  //     throw Exception('Failed to load server data');
  //   }
  // }
  // Future<dynamic> getData(String name, String phone, String email) async {
  //   // print("http://localhost:18080/api/users" + id + "&pw=" +pw);
  //   final response = await http.get(Uri.parse("http://localhost:18080/api/users"), headers: {
  //     "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  //     "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
  //     "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  //     "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  //     "Content-Type": "application/json"
  //   });
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   print('Response body: ${response.body.runtimeType}');
  //
  //   if (response.statusCode == 200) {
  //     // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
  //     var responseJson = json.decode(response.body);
  //     // return responseJson;
  //     return print(responseJson);
  //   } else {
  //     // 만약 응답이 OK가 아니면, 에러를 던집니다.
  //     throw Exception('Failed to load post');
  //   }
  // }

  Future<List<Data>> getData() async {
    final response = await http.get(Uri.parse("http://localhost:18080/api/users"));
    return json.decode(response.body);
  }

  // Future<List<Data>> getData() async {
  //   final response = await http.get(Uri.parse("http://172.30.1.44:18080/api/users"));
  //   if (response.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(response.body);
  //     List<Data> data = body.map((dynamic item) => Data.fromJson(item)).toList();
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     print('Response body: ${response.body.runtimeType}');
  //     return data;
  //   } else {
  //     throw "Failed to load cases list";
  //   }
  // }

  //GetUser
  Future<dynamic> getUserData() async {
    var response = await http.get(Uri.parse("http://172.30.1.44:18080/api/users/{id}"));
    return json.decode(response.body);
  } // 에러


  //AddUser - CRUD
  Future<http.Response> addUser(String name, String phone,
      String email) async {
    var url = Uri.parse("http://172.30.1.44:18080/api/users");
    Map data = {
      'name':  '$name',
      'phone': '$phone',
      'mail': '$email',

    };
    // encode Map to Json
    var body = json.encode(data);

    var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    // print(object);
    print("{$response.body}"); //t/f를 받음
    return response;
  }

  // update or put
  Future<http.Response> updateUserData(String id, String name,
      String email, String phone) async {
    int a = int.parse(id);
    print(e);
    var url = Uri.parse("http://172.30.1.44:18080/api/users/{id}");

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
    var url = Uri.parse("http://172.30.1.44:18080/api/users/{id}");
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