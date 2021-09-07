import 'package:flutter/material.dart';


class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('문의사항',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
