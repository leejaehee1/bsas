import 'dart:convert';
import 'package:bsas/model/user_model.dart';
import 'package:http/http.dart' as http;

class DBHelper {

  Future<dynamic> getData() async {
    var response = await http.get(Uri.parse("http://3.36.200.118:18080/api/users"));
    // http://3.36.200.118:18080/api/users
    return json.decode(response.body);
  }

  Future<User> getUserData() async {
    final response = await http.get(Uri.parse("http://3.36.200.118:18080/api/users/{id}"));
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
      Uri.parse('http://3.36.200.118:18080/api/users'),
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
  Future<User> updateUser(String id, String name, String phone, String email) async {
    final response = await http.put(
      Uri.parse('http://3.36.200.118:18080/api/users/{id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id' : id,
        'name': name,
        'phone' : phone,
        'email' : email,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('name: ${id}');
    print('name: ${name}');
    print('name: ${phone}');

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user.');
    }
  }


  //delete
  Future<User> deleteUser(String id) async {
    // int a = int.parse(id);
    // print(a);
    final http.Response response = await http.delete(
      Uri.parse('http://3.36.200.118:18080/api/users/{id}'), // {id} id번호가 자동으로 들어감
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print('Response status: ${response.statusCode}');
    print('id: ${id}');
    if (response.statusCode == 400) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete user.');
    }
  }
  // Future<http.Response> deleteUser(String id) async {
  //   int a = int.parse(id);
  //   print(a);
  //   var url = 'http://3.36.200.118:18080/api/users/{id}';
  //
  //   var response =
  //   await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json; charset=UTF-8"});
  //   print("${response.statusCode}");
  //   return response;
  // }
}