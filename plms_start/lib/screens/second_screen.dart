import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:plms_start/screens/utils/swich_punch.dart';
// import 'utils/dropbox_text.dart';
import 'utils/dropbox_text4.dart';
import 'utils/dropbox_text5.dart';
import 'utils/dropbox_text6.dart';
import 'utils/dropbox_text7.dart';
import 'utils/tagging_text.dart';
// import 'utils/textfield_text.dart';
import 'utils/title_text.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleText(
                        title: 'Assign',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      DropboxText4(),
                      DropboxText5(text: 'Discipline'),
                      DropboxText6(text: 'Raised On'),
                      DropboxText7(text: 'Target Date'),
                      TaggingButton(name: 'Keyword'),
                      SwitchButton(
                        name: 'Design Change Required',
                      ),
                      SwitchButton(
                        name: 'Material Required',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _switch(String text) {
  //   bool _isChecked = false;
  //   return Row(
  //     children: [
  //       SizedBox(
  //         child: Text(text),
  //       ),
  //       Switch(
  //         value: _isChecked,
  //         onChanged: (value) {
  //           setState(() {
  //             _isChecked = value;
  //           });
  //         },
  //       )
  //     ],
  //   );
  // }
}
