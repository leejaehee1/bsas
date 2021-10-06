import 'package:flutter/material.dart';


class EnvironmentInfo extends StatefulWidget {
  @override
  _EnvironmentInfoState createState() => _EnvironmentInfoState();
}

class _EnvironmentInfoState extends State<EnvironmentInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('환경정보',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
