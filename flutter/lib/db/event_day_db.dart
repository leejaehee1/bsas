import 'package:http/http.dart' as http;
import 'dart:convert';

class BannerDb {
  String _imageUrl = "img_url";
  httpGet(String api) async {
    return http.get(Uri.parse(_imageUrl));
  }
}

// class BannerModel {
//   Future<dynamic> getBanner() async {
//     var response = await http.get(Uri.parse("url")); //image_url 넣기
//     return response;
//   }
// }

// class EventDayDb{
//   Future<List> getEventDay() async {
//     var url = "http://3.36.200.118:18080/api/eventDay";
//     var response = await http.get(Uri.parse(url),
//         headers: {'Content-Type': 'application/json; charset=UTF-8'});
//     print(response.body);
//
//     return json.decode(response.body);
//   }
// }