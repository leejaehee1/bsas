import 'package:flutter/material.dart';


class SirenExamplePage extends StatefulWidget {
  @override
  _SirenExamplePageState createState() => _SirenExamplePageState();
}

class _SirenExamplePageState extends State<SirenExamplePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('경보사례',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
