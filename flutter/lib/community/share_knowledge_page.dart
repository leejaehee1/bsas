import 'package:flutter/material.dart';


class KnowledgePage extends StatefulWidget {
  @override
  _KnowledgePageState createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('지식/재능 공유',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
