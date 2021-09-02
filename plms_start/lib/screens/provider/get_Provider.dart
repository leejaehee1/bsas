import 'package:get/get.dart';

class UserProvider extends GetConnect {
  // Get request
  Future<Response> getUser(String id) =>
      get('http://10.0.2.2:5000/api/category');
  // Post request
  Future<Response> postUser(dynamic data) =>
      post('http://10.0.2.2:5000/api', data);
}
