import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'swich_punch.dart';

class ImagePickers extends StatefulWidget {
  const ImagePickers({Key? key}) : super(key: key);

  @override
  _ImagePickersState createState() => _ImagePickersState();
}

class _ImagePickersState extends State<ImagePickers> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageList = [];
  // double len = [].length as double;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: 250,
      // width: 1000,
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SwitchButton(name: 'Upload Images now'),
          Row(
            children: [
              Text('Photo'),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    AlertDialog(
                      content: new Text("Are you sure you want to Delete?"),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            new ElevatedButton(
                              child: new Text("No"),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            new ElevatedButton(
                              child: new Text("Yes"),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  });

                  // _imageButton();
                },
                child: Container(
                  child: Column(
                    children: [
                      Icon(Icons.image),
                      Text('button'),
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  imageSelect();
                },
                child: const Text("select Image"),
              ),
              OutlinedButton(
                onPressed: () {
                  videoSelect();
                },
                child: const Text("take Image"),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: _imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(
                        File(_imageList[index].path),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          child: IconButton(
                            onPressed: () {
                              _showDialog(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text("Are you sure you want to Delete?"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new ElevatedButton(
                  child: new Text("No"),
                  onPressed: () {
                    Get.back();
                  },
                ),
                new ElevatedButton(
                  child: new Text("Yes"),
                  onPressed: () {
                    _imageList.removeAt(index);
                    setState(() {});
                    Get.back();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  // void _imageButton() {
  //   Row(
  //     children: [
  //       InkWell(
  //         child: Container(
  //           child: Row(
  //             children: [Icon(Icons.album), Text("Gallery")],
  //           ),
  //         ),
  //         onTap: () {
  //           imageSelect();
  //         },
  //       ),
  //       InkWell(
  //         child: Container(
  //           child: Row(
  //             children: [Icon(Icons.camera), Text("Camera")],
  //           ),
  //         ),
  //         onTap: () {
  //           videoSelect();
  //         },
  //       ),
  //     ],
  //   );
  // }

  void imageSelect() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    try {
      if (selectedImage!.path.isNotEmpty) {
        _imageList.add(selectedImage);
      }
      setState(() {});
    } catch (e) {}
  }

  void videoSelect() async {
    final XFile? takenImage =
        await _picker.pickImage(source: ImageSource.camera);
    try {
      if (takenImage!.path.isNotEmpty) {
        _imageList.add(takenImage);
      }
      setState(() {});
    } catch (e) {}
  }
}
