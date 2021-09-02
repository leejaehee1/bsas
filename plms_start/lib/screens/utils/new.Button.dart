import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:plms_start/screens/models/model.dart';

class ButtonNew extends StatefulWidget {
  const ButtonNew({Key? key}) : super(key: key);

  @override
  _ButtonNewState createState() => _ButtonNewState();
}

class _ButtonNewState extends State<ButtonNew> {
  var _data = [];
  var dropdownValue = 'A';

  void initState() {
    // getJsons();
    test();
    super.initState();
  }

  dynamic test() async {
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    var user = User.fromJson(json);

    this.setState(() {
      _data = [user.result[0]['category'], user.result[1]['category']];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: DropdownButton<String>(
        isDense: true,
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: _data.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
