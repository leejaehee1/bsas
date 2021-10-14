import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class EditProfileDetail extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileDetail> {

  Future<List> getData() async {
    var response = await http.get(Uri.parse("http://54.180.102.153:18080/api/users"));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
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
        title: Text('프로필 편집',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? _buildQuestion( //_buildQuestion class에서 각 데이터를 가져옴
            list: snapshot.data!,
          )
              : const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _buildQuestion extends StatelessWidget {
  final List list;
  _buildQuestion({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 :list.length,
      itemBuilder: (context, index) {
        return Column(
            children: [
              Container(
                height: 150,
                child: Center(
                  child: ListTile(
                    title: Text(list[index]['name'].toString()), // 로그인 기능 연동 후 닉네임 data 넣어야함
                    subtitle: Text(list[index]['email'].toString()), // 로그인 기능 연동 후 이메일 data 넣어야함
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0, color: Color(0xFFD6D6D6)
                        )
                    )

                ),
              ),
              _textField('계정변경',),
              _textField('로그아웃'),
              _textField('탈퇴하기'),
            ]
        );
      }
    );
  }
  // 위젯 모음
  Widget _title(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
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
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w500
      ),
    );
  }

  Widget _textField(String text,) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),
      ),
      trailing: IconButton(
        icon: Icon(
            Icons.arrow_forward_ios_rounded
        ), onPressed: () {

        // Navigator.push(context, MaterialPageRoute(builder: (_) => UserInfoEdit()));
      },
      ),
    );
  }
}


