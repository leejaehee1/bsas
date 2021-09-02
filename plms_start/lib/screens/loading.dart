import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    test();
    super.initState();
  }

  Future<dynamic> test() async {
    List<String> data = [];
    List<String> data2 = [];
    List<String> data3 = [];
    List<String> data4 = [];
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    print(json.runtimeType);
    print(json[0]['category']);
    int len = json.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len; i++) {
          data += [json[i]['category']];
        }
      });
///////////////////////////////
    var uriResponse2 = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/system/',
      ),
    );

    var json2 = jsonDecode(uriResponse2.body);
    print(json2[0]['system']);
    int len2 = json2.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len2; i++) {
          data2 += [json2[i]['system']];
        }
      });
/////////////////////////////
    var uriResponse3 = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/subsystem/',
      ),
    );

    var json3 = jsonDecode(uriResponse3.body);
    print(json3[0]['subsystem']);
    int len3 = json3.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len3; i++) {
          data3 += [json3[i]['subsystem']];
        }
      });
////////////////////////
    var uriResponse4 = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/discipline/',
      ),
    );

    var json4 = jsonDecode(uriResponse4.body);
    print(json4[0]['discipline']);
    int len4 = json4.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len4; i++) {
          data4 += [json4[i]['discipline']];
        }
      });

    // Get.to(
    //     DropboxText(
    //         // text: '',
    //         ),
    //     arguments: data);
    Get.toNamed("/punchList", arguments: [
      data,
      data2,
      data3,
      data4,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 1);
  }
}
