import 'package:flutter/material.dart';


class EditQuestion extends StatefulWidget {

  @override
  _EditQuestionState createState() => _EditQuestionState();
}

class _EditQuestionState extends State<EditQuestion> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_rounded),
        backgroundColor: Color(0xFF43aa8b),
        title: Text('프로필 편집',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
