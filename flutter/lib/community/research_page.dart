import 'package:flutter/material.dart';


class ResearchPage extends StatefulWidget {
  @override
  _ResearchPageState createState() => _ResearchPageState();
}

class _ResearchPageState extends State<ResearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('설문/투표',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
