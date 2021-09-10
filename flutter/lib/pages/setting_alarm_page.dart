import 'package:flutter/material.dart';


class SettingAlarmPage extends StatefulWidget {
  @override
  _SettingAlarmPagePageState createState() => _SettingAlarmPagePageState();
}

class _SettingAlarmPagePageState extends State<SettingAlarmPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('알람설정',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
