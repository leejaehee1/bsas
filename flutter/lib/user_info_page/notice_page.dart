import 'package:flutter/material.dart';


class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('공지사항',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
