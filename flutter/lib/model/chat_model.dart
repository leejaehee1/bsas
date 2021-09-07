import 'dart:convert';
import 'package:http/http.dart' as http;
import '/model/chat.dart';

class ChatViewModel {
  String url = 'https://localhost:18080/chats';

  Future<List<Chat>> fetchPost() async {
    final response = await http.get(Uri.parse("http://127.0.0.1:18080/chats"), headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
      "Content-Type": "application/json"
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
      List responseJson = json.decode(response.body);
      return responseJson.map((chat) => new Chat.fromJson(chat)).toList();
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}
