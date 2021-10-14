import 'package:flutter/material.dart';


class QuestionDetail extends StatefulWidget {
  List list;
  int index;
  QuestionDetail({required this.index, required this.list});

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
        title: Text('문의',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
