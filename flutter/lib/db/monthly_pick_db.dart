import 'dart:convert';
import 'package:bsas/model/monthly_pick.dart';
import 'package:http/http.dart' as http;

class MonthlyPickDB{
  Future<MonthlyPick> getMonthlyPick() async {
    var response = await http.get(Uri.parse("http://3.36.200.118:18080/api/monthlyPick")); //주소 넣기
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 400) {
      return MonthlyPick.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}