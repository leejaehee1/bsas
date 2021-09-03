import 'dart:async';

import 'package:bsas/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navigate_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

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
              Color(0xFFDCEDC8),
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
                "image/icon_seven.png",
                width: 300,
                height: 200,
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
            ],
          ),
        ),
      ),
    );
  }
}
