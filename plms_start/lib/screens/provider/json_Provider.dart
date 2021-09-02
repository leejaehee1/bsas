import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import 'package:plms_start/screens/models/model.dart';

class JsonData extends StatefulWidget {
  JsonData({Key? key}) : super(key: key);
  // List<String> data = [];
  @override
  _JsonDataState createState() => _JsonDataState();
}

class _JsonDataState extends State<JsonData> {
  List<String> data = [];

  dynamic test() async {
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    var user = User.fromJson(json);
    int len = user.result.length;

    this.setState(() {
      for (int i = 0; i < len; i++) {
        data += [user.result[i]['category']];
      }
    });

    // print(data);
  }

  void initState() {
    test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

JsonData jsondata = JsonData();
