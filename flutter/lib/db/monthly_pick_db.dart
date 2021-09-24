import 'dart:convert';
import 'package:bsas/model/monthly_pick.dart';
import 'package:http/http.dart' as http;
import 'package:bsas/model/event_day.dart';

class MonthlyPickDB{
  Future<MonthlyPick> getEvent() async {
    var response = await http.get(Uri.parse("http://3.36.200.118:18080/api/url")); //주소 넣기
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 400) {
      return MonthlyPick.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}