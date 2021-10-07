import 'package:bsas/db/customer_question_db.dart';
import 'package:bsas/db/user_db.dart';
import 'package:flutter/material.dart';


class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {

  String title = '';
  String contents = '';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentsController = TextEditingController();

  CustomerDbHelper questionDbHelper = CustomerDbHelper();

  // 문의사항 입력 위젯 설정
  //title 위젯
  Widget _titleInfo(String text, dynamic controller, dynamic editController) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(fontSize: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF43aa8b),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (input) => //유효성 검사
        input!.trim().isEmpty ? text : null,
        onSaved: (input) => controller = input!,
        controller: editController,
      ),
    );
  }
  // contents 위젯
  Widget _contentsInfo(String contents, dynamic controller, dynamic editController) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          maxLines: 18,
          style: TextStyle(fontSize: 18.0),
          decoration: InputDecoration(
            hintText: contents,
            hintStyle: TextStyle(fontSize: 15),
            // contentPadding: EdgeInsets.symmetric(vertical: 200),
            labelStyle: TextStyle(fontSize: 13.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF43aa8b),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (input) => //유효성 검사
          input!.trim().isEmpty ? contents : null,
          onSaved: (input) => controller = input!,
          controller: editController,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text('문의',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _titleInfo('제목을 입력해주세요', title, _titleController),
            _contentsInfo('앱 사용에 관한 불편, 기능, 요청, 개선사항 등의 의견을 작성해주시면 확인하여 개선 및 답변드리겠습니다.',
              contents, _contentsController),
            SizedBox(height: 2),
            SizedBox(
              width: 340,
              height: 50,
              child: RaisedButton(onPressed: (){},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: Color(0xFF4CC87B),
              child: Text('사진 업로드', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
            )
          ],
        ),
      ),
    );
  }
}
