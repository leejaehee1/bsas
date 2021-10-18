import 'package:bsas/db/user_db.dart';
import 'package:bsas/pages/user_infomation.dart';
import 'package:flutter/material.dart';

import 'edit_profile.dart';


class UserInfoEdit extends StatefulWidget {

  final List list;
  final int index;

  UserInfoEdit({required this.list, required this.index});

  @override
  _UserInfoEditState createState() => _UserInfoEditState();
}

class _UserInfoEditState extends State<UserInfoEdit> {

  DBHelper databaseHelper = DBHelper();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _idController = TextEditingController();

  @override
  void initState() {
    _nameController = TextEditingController(
        text: widget.list[widget.index]['name'].toString());
    _phoneController = TextEditingController(
        text: widget.list[widget.index]['phone'].toString());
    _emailController = TextEditingController(
        text: widget.list[widget.index]['email'].toString());
    _idController = TextEditingController(
        text: widget.list[widget.index]['id'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text('계정 변경',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Column(
        children: [
        //   ListTile(
        //   title: _title('닉네임'), // 로그인 기능 연동 후 닉네임 data 넣어야함
        //   subtitle: _subtitle('이메일'), // 로그인 기능 연동 후 이메일 data 넣어야함
        // ),
          Form(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Column(
                    children: [
                      _textField(_nameController, "이름", "이름"),
                      _textField(_emailController, "이메일", "이메일"),
                      _textField(_phoneController, "주소", "주소"),
                      RaisedButton(
                        child: Text('편집',
                        style: TextStyle(color: Colors.white),
                        ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.green,
                          onPressed: (){
                        databaseHelper.updateUser(
                          _idController.text.trim(),
                          _nameController.text.trim(),
                          _emailController.text.trim(),
                          _phoneController.text.trim(),
                        );
                        _navigateUserInfoList(context);
                      }
                      )
                    ],
                  )
                ],
              ))
    ]
      ),
    );
  }

  _navigateUserInfoList(BuildContext context) async {
    final result = await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EditProfileDetail()));

    if (result) {
      setState(() {});
    }
  }

  // 위젯 모음
  Widget _title(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 28,
        fontWeight: FontWeight.w500
      ),
    );
  }

  Widget _textField(dynamic controller, String hintText, String labelText) {
    return ListTile(
      title: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) return "name";
        },
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
        ),
      ),
    );
  }
}
