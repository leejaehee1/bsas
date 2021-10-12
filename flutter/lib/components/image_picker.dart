import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload Example"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.25,
                child: FutureBuilder(
                  future: _getImage(context),
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
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)),
              ),
            ],
          ),
          SizedBox(height: 20,),
          RaisedButton( //image 업로드 하기
            color: Colors.cyan,
            onPressed: onUploadImage,
            child: Text("Upload"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton( // image 가져오기
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
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

  onUploadImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://54.180.102.153:18080/api/monthlyPick'),
    );
    Map<String, String> headers = {"Content-type": 'application/json; charset=UTF-8'};
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