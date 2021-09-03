import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigate_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF43aa8b),
              Colors.teal,
            ], // 그라데이션 색상 수정
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: 100),
              Container(
                  child: Image.asset(
                "image/icon_first.png",
                width: 400,
                height: 300,
              )),
              SizedBox(height: 10),
              Container(
                child: Text(
                  'BSAS', //글자 색상 및 폰트 수정
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 80),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 60.0,
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    'join us', // 로그인 화면으로 구성하기
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  color: Color(0xFF7E57C2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    NavigatorPage(); //회원가입 페이지로 이동 //회원가입 페이지 만들기
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
