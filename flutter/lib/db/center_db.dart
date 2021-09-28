import 'dart:convert';
import 'package:bsas/model/center_model.dart';
import 'package:http/http.dart' as http;

class CenterDBHelper {

  Future<dynamic> getData() async {
    var response = await http.get(Uri.parse("http://54.180.102.153:18080/api/centers"));
    return json.decode(response.body);
  }

  Future<Center> getCenterData() async {
    final response = await http.get(Uri.parse("http://54.180.102.153:18080/api/centers/{id}"));
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 400) {
      return Center.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load center');
    }
  }


  //AddUser - Crud
  Future<http.Response> addCenter(String name, String phone, String publicPhone, String email) async {

    Map center = {
      'name' : name,
      'phone' : phone,
      'publicPhone' : publicPhone,
      'email' : email,
    };

    var body = json.encode(center);

    var response = await http.post(Uri.parse('http://54.180.102.153:18080/api/centers'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8'},
        body: body);

    print('Response status: ${response.statusCode}');
    print("${response.body}");
    return response;
  }

  // update or put
  Future<http.Response> updateCenter(String id, String name, String phone, String publicPhone, String email) async {
    Map center = {
      'id' : id,
      'name' : name,
      'phone' : phone,
      'publicPhone' : publicPhone,
      'email' : email
    };

    var body = json.encode(center);

    var response = await http.put(Uri.parse('http://54.180.102.153:18080/api/centers/'+ id),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: body);
    print('${response.statusCode}');
    print('${response.body}');
    return response;
  }


  //delete
  Future<http.Response> deleteCenter(String id) async {
    var url = 'http://54.180.102.153:18080/api/centers/'+ id; // id 부분은 따로 빼줘야 함, 여태까지 string 으로 인식하고  있어서 처리가 안됨

    var response =
    await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json; charset=UTF-8"});
    print("${response.statusCode}");
    print("id : ${id}");
    return response;
  }
}