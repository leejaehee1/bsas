import 'dart:io';
import 'package:bsas/db/customer_question_db.dart';
import 'package:bsas/model/customer_question_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  String title = '';
  String contents = '';

  File? selectedImage;

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
  Widget _contentsInfo(
      String contents, dynamic controller, dynamic editController) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          maxLines: 10,
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
        title: Text(
          '문의',
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
            _contentsInfo(
                '앱 사용에 관한 불편, 기능, 요청, 개선사항 등의 의견을 작성해주시면 확인하여 개선 및 답변드리겠습니다.',
                contents,
                _contentsController),
            SizedBox(height: 5),
            ListTile(
              leading: Text("사진업로드", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              title: Text("(최대5장)", style: TextStyle(fontSize: 13, color: Colors.black26),),
              trailing: IconButton(
                icon: Icon(Icons.camera_alt_rounded, size: 30),
                onPressed: getImage,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 90,
                  width: 100,
                  child: FutureBuilder(
                    future: _getImage(context), //index로 사진 가져와야함
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Text('Please wait');
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError)
                            return Text('Error: ${snapshot.error}');
                          else {
                            return selectedImage != null
                                ? Image.file(selectedImage!)
                                : Center(
                              child: Text("Please Get the Image"),
                            );
                          }
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 50,
              child: RaisedButton(onPressed:
              (){
                onUploadImage(
                  _titleController.text,
                  _contentsController.text
                );
                Navigator.pop(context, true);
              },
              //     (){
              //   questionDbHelper.addQuestion(
              //       _titleController.text,
              //       _contentsController.text);
              //   Navigator.pop(context, true);
              // },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Color(0xFF4CC87B),
                child: Text('문의하기', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
            ),
          ],
        ),
      ),
    );
  }


  //get image from camera
  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
    //return image;
  }

  //resize the image
  Future<void> _getImage(BuildContext context) async {
    if (selectedImage != null) {
      var imageFile = selectedImage;
    }
  }
  Future<void> onUploadImage(String title, String contents) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://54.180.102.153:18080/api/monthlyPick'),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.fields['title'] = title;
    request.fields['contents'] = contents;

    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage!.readAsBytes().asStream(),
        selectedImage!.lengthSync(),
        filename: selectedImage!.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
  }
}
