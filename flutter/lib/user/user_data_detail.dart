import 'package:bsas/db/user_db.dart';
import 'package:bsas/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bsas/model/data_model.dart';
import 'dart:convert';
import 'package:bsas/model/user_model.dart';
import 'package:http/http.dart' as http;

Future<User> getUserData() async {
  final response = await http.get(Uri.parse("http://172.30.1.44:18080/api/users/{id}"));
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

Future<User> updateUser(String name, String phone, String email) async {
  final response = await http.put(
    Uri.parse('http://172.30.1.44:18080/api/users/{id}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'phone' : phone,
      'email' : email,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
class DataDetail extends StatefulWidget {
  User data;
  DataDetail(this.data);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DataDetailState(data);
  }
}

enum Options { delete, update }

class DataDetailState extends State {
  User data;
  DataDetailState(this.data);
  late Future<User> _futureUser;
  var dbHelper = DBHelper();
  var _nameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureUser = getUserData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF43aa8b),
          title: Text(
            "편집",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<User>(
              future: _futureUser,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(snapshot.data!.userName!),
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: '이름을 입력하세요',
                          ),
                        ),
                        Text(snapshot.data!.userPhone!),
                        TextField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: '전화번호를 입력하세요',
                          ),
                        ),
                        Text(snapshot.data!.userEmail!),
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: '메일을 입력하세요',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _futureUser = updateUser(
                                  _nameController.text, _phoneController.text,
                                  _emailController.text);
                            });
                          },
                          child: const Text('업데이트'),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                }
                return const CircularProgressIndicator();
              },
            )
        )
    );
  }
}
