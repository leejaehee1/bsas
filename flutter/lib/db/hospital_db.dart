import 'dart:convert';
import 'package:bsas/model/hospital_model.dart';
import 'package:http/http.dart' as http;

class HospitalDBHelper {

  Future<dynamic> getHosData() async {
    var response = await http.get(Uri.parse("http://54.180.102.153:18080/api/hospitals"));
    return json.decode(response.body);
  }

  Future<Hospital> getHospitalData() async {
    final response = await http.get(Uri.parse("http://54.180.102.153:18080/api/hospitals/{id}"));
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 400) {
      return Hospital.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load center');
    }
  }


  //AddUser - Crud
  // Future<Hospital> addHospital(String name, String phone, String publicPhone, String email) async {
  //   final response = await http.post(
  //     Uri.parse('http://54.180.102.153:18080/api/hospitals'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'hospitalName' : name,
  //       'hospitalPhone' : phone,
  //       'hospitalPublicPhone' : publicPhone,
  //       'hospitalEmail' : email,
  //     }),
  //   );
  //   print('Response status: ${response.statusCode}');
  //   print('name: ${name} ');
  //   if (response.statusCode == 200) {
  //     return Hospital.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load hospital');
  //   }
  // }
  Future<http.Response> addHospital(String name, String phone, String publicPhone, String email) async {

    Map hospital = {
      'name' : name,
      'phone' : phone,
      'publicPhone' : publicPhone,
      'email' : email,
    };

    var body = json.encode(hospital);

    var response = await http.post(Uri.parse('http://54.180.102.153:18080/api/hospitals'),
      headers: {
      'Content-Type': 'application/json; charset=UTF-8'},
    body: body);

    print('Response status: ${response.statusCode}');
    print("${response.body}");
    return response;
  }


  // update or put
  Future<Hospital> updateHospital(String id, String name, String phone, String publicPhone, String email) async {
    final response = await http.put(
      Uri.parse('http://54.180.102.153:18080/api/hospitals/'+ id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'hospitalId' : id,
        'hospitalName' : name,
        'hospitalPhone' : phone,
        'hospitalPublicPhone' : publicPhone,
        'hospitalEmail' : email,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('name: ${name}');

    if (response.statusCode == 200) {
      return Hospital.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update hospitals.');
    }
  }
  // Future<http.Response> updateHospital(String id, String name, String phone, String publicPhone, String email) async {
  //   Map data = {
  //     'id' : id,
  //     'name' : name,
  //     'phone' : phone,
  //     'publicPhone' : publicPhone,
  //     'email' : email
  //   };
  //
  //   var body = json.encode(data);
  //
  //   var response = await http.put(Uri.parse('http://54.180.102.153:18080/api/hospitals/{id}'),
  //       headers: {'Content-Type': 'application/json; charset=UTF-8'},
  // body: body);
  //   print('${response.statusCode}');
  //   print('${response.body}');
  //   return response;
  // }


  //delete
  Future<http.Response> deleteHospital(String id) async {
    var url = 'http://54.180.102.153:18080/api/hospitals/'+ id; // id 부분은 따로 빼줘야 함, 여태까지 string 으로 인식하고  있어서 처리가 안됨

    var response =
    await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json; charset=UTF-8"});
    print("${response.statusCode}");
    print("id : ${id}");
    return response;
  }
}