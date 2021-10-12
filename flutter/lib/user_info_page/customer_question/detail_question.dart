import 'package:flutter/material.dart';


class QuestionDetail extends StatefulWidget {

  @override
  _QuestionDetailState createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_rounded),
        backgroundColor: Color(0xFF43aa8b),
        title: Text('상세 프로필',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
