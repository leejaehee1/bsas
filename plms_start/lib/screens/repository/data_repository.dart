// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:plms_start/screens/models/model.dart';

// class PostRepository {
//   Future<List<User>> loadData() async {
//     final response = await http.get(
//       Uri.parse(
//         'http://10.0.2.2:5000/api/category/',
//       ),
//     );
//     if (response.body != null) {
//       Map<String, dynamic> parsedResponse = jsonDecode(response.body);
//       if (parsedResponse['result'] != null) {
//         List<dynamic> body = parsedResponse['result'];
//         return body.map<User>((json) => User.fromJson(json)).toList();
//       }
//     }
//   }
// }
