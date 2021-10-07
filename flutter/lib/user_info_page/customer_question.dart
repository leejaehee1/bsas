import 'package:flutter/material.dart';


class CustomerQuestionPage extends StatefulWidget {
  @override
  _CustomerQuestionState createState() => _CustomerQuestionState();
}

class _CustomerQuestionState extends State<CustomerQuestionPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('문의',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
