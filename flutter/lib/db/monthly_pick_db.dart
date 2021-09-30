import 'dart:convert';
import 'package:bsas/model/monthly_pick.dart';
import 'package:http/http.dart' as http;

List<MonthlyPick> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<MonthlyPick>((json) => MonthlyPick.fromJson(json)).toList();
}

Future<List<MonthlyPick>> monthlyPick(http.Client client) async {
  final response =
  await client.get(Uri.parse("http://54.180.102.153:18080/api/monthlyPick"));
  return parsePhotos(response.body);
}