import 'dart:convert';
import 'package:bsas/model/hospital_model.dart';
import 'package:http/http.dart' as http;

class HospitalDBHelper {

  Future<dynamic> getData() async {
    var response = await http.get(Uri.parse("http://3.36.200.118:18080/api/hospitals"));
    return json.decode(response.body);
  }

  Future<Hospital> getHospitalData() async {
    final response = await http.get(Uri.parse("http://3.36.200.118:18080/api/hospitals/{id}"));
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 400) {
      return Hospital.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load center');
    }
  }


  //AddUser - Crud
  Future<Hospital> addHospital(String name, String phone, String publicPhone, String email) async {
    final response = await http.post(
      Uri.parse('http://3.36.200.118:18080/api/hospitals'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'hospitalName' : name,
        'hospitalPhone' : phone,
        'hospitalPublicPhone' : publicPhone,
        'hospitalEmail' : email,
      }),
    );
    if (response.statusCode == 500) {
      return Hospital.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load hospital');
    }
  }

  // update or put
  Future<Hospital> updateHospital(String name, String phone, String publicPhone, String email) async {
    final response = await http.put(
      Uri.parse('http://3.36.200.118:18080/api/hospitals/{id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'hospitalName' : name,
        'hospitalPhone' : phone,
        'hospitalPublicPhone' : publicPhone,
        'hospitalEmail' : email,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('name: ${name}');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Hospital.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update hospitals.');
    }
  }


  //delete
  Future<Hospital> deleteHospital(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://3.36.200.118:18080/api/hospitals/{id}'), // {id} id번호가 자동으로 들어감
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Hospital.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete hospitals.');
    }
  }
}