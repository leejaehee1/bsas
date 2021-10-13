import 'package:bsas/db/customer_question_db.dart';
import 'package:flutter/material.dart';

import '../question_page.dart';


class EditQuestion extends StatefulWidget {

  final List list;
  final int index;

  EditQuestion({required this.list, required this.index});


  @override
  _EditQuestionState createState() => _EditQuestionState();
}

class _EditQuestionState extends State<EditQuestion> {

  CustomerDbHelper questionDbHelper = CustomerDbHelper();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentsController = TextEditingController();
  TextEditingController _idController = TextEditingController();

  _navigateQuestion(BuildContext context) async {
    final result = await Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => QuestionPage()));

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _idController = TextEditingController(
      text: widget.list[widget.index]['id'].toString());
    _titleController = TextEditingController(
        text: widget.list[widget.index]['title'].toString());
    _contentsController = TextEditingController(
        text: widget.list[widget.index]['contents'].toString());
    super.initState();
  }

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
