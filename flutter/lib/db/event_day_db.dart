import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bsas/model/event_day.dart';

class EventDayDB{
  Future<EventDay> getEvent() async {
    var response = await http.get(Uri.parse("http://3.36.200.118:18080/api/url")); //주소 넣기
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 400) {
      return EventDay.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}