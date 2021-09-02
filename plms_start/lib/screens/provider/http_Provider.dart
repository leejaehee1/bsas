import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:plms_start/screens/models/model.dart';

const url = 'http://10.0.2.2:5000/api/';

class Server {
  // Future<dynamic> getReq() async {
  //   var uriResponse = await http.get(
  //     Uri.parse(
  //       'http://10.0.2.2:5000/api/category/',
  //     ),
  //   );

  //   var json = jsonDecode(uriResponse.body);
  //   var user = User.fromJson(json);
  //   print('시작');
  //   print(user);
  // }

  // void initState() {
  //   // super.initState();
  //   test();
  // }

  void main() => runApp(const MyApp());
}

Server server = Server();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<String> data;
  dynamic test() async {
    List<String> data = [];
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    var user = User.fromJson(json);
    int len = user.result.length;
    setState(() {
      for (int i = 0; i < len; i++) {
        data += [user.result[i]['category']];
      }
    });

    // print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// void initState() {
//   // getJsons();
//   test();
//   super.initState();
// }

// // dynamic getJsons() {
// //   Network network = Network("http://10.0.2.2:5000/api/category/");

// //   var resultData = network.getJsonData();
// //   print(resultData);
// // }

// dynamic test() async {
//   var uriResponse = await http.get(
//     Uri.parse(
//       'http://10.0.2.2:5000/api/category/',
//     ),
//   );

//   var json = jsonDecode(uriResponse.body);
//   var user = User.fromJson(json);
//   var a = user.result[0]['category'];
//   var b = user.result[1]['category'];
//   print(a);
//   print(a.runtimeType);
//   Get.toNamed("/punchList", arguments: a);

//   print(a);
// }

