import 'dart:convert';
import 'package:bsas/model/user_model.dart';
import 'package:http/http.dart' as http;

class DBHelper {

  Future<dynamic> getData() async {
    var response = await http.get(Uri.parse("http:/127.0.0.1:18080/api/users"));
    return json.decode(response.body);
  }

  Future<User> getUserData() async {
    final response = await http.get(Uri.parse("http://127.0.0.1:18080/api/users/{id}"));
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 400) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }


  //AddUser - Crud
  Future<User> addUser(String name, String phone, String email) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:18080/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'phone' : phone,
        'email' : email,
      }),
    );
    if (response.statusCode == 500) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  // update or put
  Future<User> updateUser(String name, String phone, String email) async {
    final response = await http.put(
      Uri.parse('http://127.0.0.1:18080/api/users/{id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'phone' : phone,
        'email' : email,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update album.');
    }
  }


  //delete
  Future<User> deleteUser(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://127.0.0.1:18080/api/users/{id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON. After deleting,
      // you'll get an empty JSON `{}` response.
      // Don't return `null`, otherwise `snapshot.hasData`
      // will always return false on `FutureBuilder`.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a "200 OK response",
      // then throw an exception.
      throw Exception('Failed to delete album.');
    }
  }



    // //get user data -> add page와 연결
    // Future<List> getUserData() async {
    //   final response = await http.get("url");
    //   return json.decode(response.body);
    // }
  }