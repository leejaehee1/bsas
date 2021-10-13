import 'dart:convert';
import 'dart:io';
import 'package:bsas/db/customer_question_db.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';


class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

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
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        style: const TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(fontSize: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
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
  Widget _contentsInfo(String contents, dynamic controller,
      dynamic editController) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        maxLines: 10,
        style: const TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          hintText: contents,
          hintStyle: const TextStyle(fontSize: 15),
          // contentPadding: EdgeInsets.symmetric(vertical: 200),
          labelStyle: const TextStyle(fontSize: 13.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
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
        title: const Text(
          '문의',
          style: TextStyle(
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
            const SizedBox(height: 5),
            ListTile(
              leading: const Text("사진업로드",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              title: const Text("(최대3장)",
                style: TextStyle(fontSize: 13, color: Colors.black26),),
              trailing: IconButton(
                icon: const Icon(Icons.camera_alt_rounded, size: 30),
                onPressed: getImage,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  height: 90,
                  width: 100,
                  child: FutureBuilder(
                    future: _getImage(context), //index로 사진 가져와야함
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text('Please wait');
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return selectedImage != null
                                ? Image.file(selectedImage!)
                                : const Center(
                              child: Text("Please Get the Image"),
                            );
                          }
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 50,
              child: RaisedButton(
                onPressed: // 문의하기를 누르면 title, contents, image가 back으로 post 되어야함
                    () {
                  onUploadImage();
                  Navigator.pop(context, true);
                },
                //     (){ questionDbHelper.addQuestion(
                //       _titleController.text,
                //       _contentsController.text);
                //   Navigator.pop(context, true);
                // },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: const Color(0xFF4CC87B),
                child: const Text('문의하기', style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),),
            ),
          ],
        ),
      ),
    );
  }


  //get image from gallery
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

  // upload image
  Future<Map<String, dynamic>?> onUploadImage() async {
    //string to uri
    var uri = Uri.parse('http://54.180.102.153:18080/api/monthlyPick');

    // create multipart request
    var imageUploadRequest = http.MultipartRequest('POST', (uri));

    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    imageUploadRequest.fields['title'] = title;
    imageUploadRequest.fields['contents'] = contents;

    // multipart that takes file
    var multipartFile = http.MultipartFile(
      'image', selectedImage!.readAsBytes().asStream(),
      selectedImage!.lengthSync(), filename: selectedImage!
        .path
        .split('/')
        .last);

    // add file to multipart
    imageUploadRequest.files.add(multipartFile);

    // send
    var response = await imageUploadRequest.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
}
