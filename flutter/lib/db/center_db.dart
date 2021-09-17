import 'dart:convert';
import 'package:bsas/model/center_model.dart';
import 'package:http/http.dart' as http;

class CenterDBHelper {

  Future<dynamic> getData() async {
    var response = await http.get(Uri.parse("http://3.36.200.118:18080/api/centers"));
    return json.decode(response.body);
  }

  Future<Center> getCenterData() async {
    final response = await http.get(Uri.parse("http://3.36.200.118:18080/api/centers/{id}"));
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 400) {
      return Center.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load center');
    }
  }


  //AddUser - Crud
  Future<Center> addCenter(String name, String phone, String publicPhone, String email) async {
    final response = await http.post(
      Uri.parse('http://3.36.200.118:18080/api/centers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'centerName': name,
        'centerPhone' : phone,
        'centerPublicPhone' : publicPhone,
        'ceterEmail' : email,
      }),
    );
    if (response.statusCode == 500) {
      return Center.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load center');
    }
  }

  // update or put
  Future<Center> updateCenter(String name, String phone, String publicPhone, String email) async {
    final response = await http.put(
      Uri.parse('http://3.36.200.118:18080/api/centers/{id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'centerName': name,
        'centerPhone' : phone,
        'centerPublicPhone' : publicPhone,
        'ceterEmail' : email,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('name: ${name}');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Center.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update centers.');
    }
  }


  //delete
  Future<Center> deleteCenter(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://3.36.200.118:18080/api/centers/{id}'), // {id} id번호가 자동으로 들어감
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Center.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete centers.');
    }
  }
}