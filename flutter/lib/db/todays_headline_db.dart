import 'dart:convert';
import 'package:bsas/model/recommend_hotspot.dart';
import 'package:http/http.dart' as http;

class TodaysHeadline{
  Future<RecommendHotspot> getHeadline() async {
    var response = await http.get(Uri.parse("http://3.36.200.118:18080/api/todaysHeadline")); //주소 넣기
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 400) {
      return RecommendHotspot.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}