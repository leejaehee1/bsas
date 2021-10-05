import 'dart:convert';
import 'package:bsas/model/recommend_activity.dart';
import 'package:http/http.dart' as http;

List<RecommendActivity> recommendAct(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<RecommendActivity>((json) => RecommendActivity.fromJson(json)).toList();
}

Future<List<RecommendActivity>> recommendActivity(http.Client client) async {
  final response =
  await client.get(Uri.parse("http://54.180.102.153:18080/api/recommendActivity"));
  return recommendAct(response.body);
}