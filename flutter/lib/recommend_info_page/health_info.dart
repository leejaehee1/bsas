import 'package:flutter/material.dart';


class HealthInfo extends StatefulWidget {
  @override
  _HealthInfoState createState() => _HealthInfoState();
}

class _HealthInfoState extends State<HealthInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('건강정보',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
