import 'dart:convert';

import 'package:bsas/db/user_db.dart';
import 'package:bsas/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'user_home_screen.dart';
import 'package:http/http.dart' as http;


class AddUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddUserState();
  }
}

class AddUserState extends State {
  String _name = '';
  String _publicPhone = '';
  String _mail = '';

  final DBHelper dbHelper = DBHelper();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();//입력 끊어주는 역할
    super.dispose();
  }

  Future<User>? _futureUser;

  Future<User> addUser(String name, String phone, String email) async {
    final response = await http.post(
      Uri.parse('http://172.30.1.44:18080/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'phone' : phone,
        'email' : email,
      },),
    );
    print('Response status: ${response.statusCode}');
    print('name: ${name}');

    if (response.statusCode == 500) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }


  // @override
  // void dispose() {
  //   super.initState();
  //   //입력 끊어주는 역할
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // or white or 0xFF00C853
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 100.0), //
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen())),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  '지인 등록',
                  style: TextStyle(
                    color: Color(0xFF43aa8b),
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  // key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            labelText: '이름',
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF43aa8b),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          validator: (input) => //유효성 검사
                          input!.trim().isEmpty ? '이름을 입력하세요' : null,
                          onSaved: (input) => _name = input!,
                          // initialValue: _name,
                          controller: _nameController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                              labelText: '전화번호',
                              labelStyle: TextStyle(fontSize: 18.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF43aa8b),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                          validator: (input) =>
                          input!.trim().isEmpty ? '전화번호를 입력하세요' : null,
                          onSaved: (input) => _publicPhone = input!,
                          // initialValue: _publicPhone,
                          controller: _phoneController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                              labelText: '이메일',
                              labelStyle: TextStyle(fontSize: 18.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF43aa8b),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                          validator: (input) =>
                          input!.trim().isEmpty ? '이메일을 입력하세요' : null,
                          onSaved: (input) => _mail = input!,
                          // initialValue: _mail,
                          controller: _emailController,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 60.0,
                        width: double.infinity,
                        // decoration: BoxDecoration(
                        //   color: Color(0xFF00C853),
                        //   borderRadius: BorderRadius.circular(80.0),
                        // ),
                        child: RaisedButton(
                          child: Text(
                            '저장',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          color: Color(0xFF43aa8b),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: () {
                            _futureUser = addUser(_nameController.text, _phoneController.text, _emailController.text);
                            // var addUser = await DBHelper.addUser(
                            //     _nameController.text, _phoneController.text, _emailController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  FutureBuilder<User> buildFutureBuilder() {
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.userName!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}


//   void addUser() async {
//     var result = await DBHelper.addUser(
//       txtName.text,
//       txtpublicPhone.text,
//       txtmail.text,
//     );
//     Navigator.pop(context, true);
//   }
// }

//   void addUser() async{
//     var result = await dbHelper.addUser(Data(
//       name: txtName.text,
//       publicPhone: txtpublicPhone.text,
//       mail: txtmail.text
//     ));
//     Navigator.pop(context,true);
//   }
// }

