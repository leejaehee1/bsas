import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bsas/model/todays_headline.dart';

class TodaysHeadlineDb{
  Future<TodaysHeadline> getHeadline() async {
    var response = await http.get(Uri.parse("http://54.180.102.153:18080/api/todaysHeadline")); //주소 넣기
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      return TodaysHeadline.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}