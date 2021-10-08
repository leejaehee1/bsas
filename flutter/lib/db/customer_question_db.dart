import 'dart:convert';
import 'package:bsas/model/customer_question_model.dart';
import 'package:http/http.dart' as http;

class CustomerDbHelper {

  Future<List> getQuestionData() async {
    var response = await http.get(Uri.parse("http://54.180.102.153:18080/api/recommendActivity"));
    return json.decode(response.body);
  }

  Future<CustomerQuestion> getUserData() async {
    final response = await http.get(Uri.parse("http://54.180.102.153:18080/api/recommendActivity/{id}"));
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      return CustomerQuestion.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }


  //AddUser - Crud //image 추가해야함
  Future<CustomerQuestion> addQuestion(String title, String contents) async {
    final response = await http.post(
      Uri.parse('http://54.180.102.153:18080/api/recommendActivity'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'contents' : contents,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('title: ${title}');
    if (response.statusCode == 200) {
      return CustomerQuestion.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  // update or put
  Future<CustomerQuestion> updateQuestion(String id, String title, String contents) async {
    final response = await http.put(
      Uri.parse('http://54.180.102.153:18080/api/recommendActivity/' + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id' : id,
        'title': title,
        'contents' : contents,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('name: ${id}');
    print('name: ${title}');
    print('name: ${contents}');

    if (response.statusCode == 200) {
      return CustomerQuestion.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user.');
    }
  }

  Future<http.Response> deleteQuestion(String id) async {
    var url = 'http://54.180.102.153:18080/api/recommendActivity/'+ id; // id 부분은 따로 빼줘야 함, 여태까지 string 으로 인식하고  있어서 처리가 안됨

    var response =
    await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json; charset=UTF-8"});
    print("${response.statusCode}");
    print("id : ${id}");
    return response;
  }
}