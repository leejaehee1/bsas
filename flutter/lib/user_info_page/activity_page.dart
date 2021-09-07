import 'package:flutter/material.dart';


class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('활동내역',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
