import 'package:flutter/material.dart';


class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('설정',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
