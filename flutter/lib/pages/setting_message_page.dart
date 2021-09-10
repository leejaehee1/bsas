import 'package:flutter/material.dart';


class SettingMessagePage extends StatefulWidget {
  @override
  _SettingMessagePageState createState() => _SettingMessagePageState();
}

class _SettingMessagePageState extends State<SettingMessagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('메세지설정',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
