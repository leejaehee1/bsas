import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:plms_start/screens/utils/swich_punch.dart';
// import 'utils/draft_screen.dart';
import 'utils/image_picker.dart';
import 'utils/title_text.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      child: Container(
        color: Color(0xFFE6E6E6),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffB7C5B9),
                  offset: Offset(-7, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // DropboxText(text: 'Action On'),
                  Row(
                    children: [
                      TitleText(
                        title: 'Attachment',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ImagePickers(),
                  Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location'),
                            ElevatedButton(
                              onPressed: () {
                                // FileImage();
                              },
                              child: Text("View Drawing"),
                            ),
                            // Text(pixelList),
                          ],
                        ),
                        InkWell(
                          onDoubleTap: () {
                            setState(() {
                              Get.toNamed("/draft");
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.width - 50,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Image.asset("assets/punch_draft_sample.jpg"),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
