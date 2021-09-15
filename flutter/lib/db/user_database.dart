// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class UserDataBaseHelper {
//
//   Future<http.Response> addUser(String nameController,
//       String phoneController, String emailController) async {
//
//     Map data = {
//       'name': '$nameController',
//       'phone': '$phoneController',
//       'email': '$emailController',
//     };
//     //encode Map to JSON
//     var body = json.encode(data);
//
//     var response = await http.post(Uri.parse('http://3.36.200.118:18080/api/users'),
//         headers: {"Content-Type": 'application/json; charset=UTF-8'}, body: body);
//     print("${response.statusCode}");
//     print("${response.body}");
//     print('name: ${nameController}');
//     return response;
//   }
//
//   //function for update or put
//   Future<http.Response> editUser(String id, String nameController,
//       String phoneController, String emailController) async {
//     int a = int.parse(id);
//     print(a);
//     // var url = 'http://192.168.1.38:9191/update';
//
//     Map data = {
//       'id': '$a',
//       'name': '$nameController',
//       'quantity': '$phoneController',
//       'price': '$emailController',
//     };
//     //encode Map to JSON
//     var body = json.encode(data);
//
//     var response = await http.put(Uri.parse('http://3.36.200.118:18080/api/users/{id}'),
//         headers: {"Content-Type": 'application/json; charset=UTF-8'}, body: body);
//     print("${response.statusCode}");
//     print("${response.body}");
//     return response;
//   }
//
//   //Funcion para agregar un producto a la BD
//   Future<http.Response> removeUser(String id) async {
//     int a = int.parse(id);
//     print(a);
//     // var url = 'http://192.168.1.38:9191/delete/$a';
//
//     var response =
//     await http.delete(Uri.parse('http://3.36.200.118:18080/api/users/{id}'),
//         headers: {"Content-Type": 'application/json; charset=UTF-8'});
//     print("${response.statusCode}");
//     return response;
//   }
// }