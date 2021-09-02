import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropboxText4 extends StatefulWidget {
  // final String text;

  DropboxText4({Key? key}) : super(key: key);

  @override
  _DropboxTextState createState() => _DropboxTextState();
}

class _DropboxTextState extends State<DropboxText4> {
  var data2 = Get.arguments[3];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text("widget.text"),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 4 / 7,
          height: 50,
          // child: Newbutton(),
          child: _newButton(),
        ),
      ],
    );
  }

  Widget _newButton() {
    return DropdownSearch<String>(
        onSaved: print,
        showSearchBox: true,
        mode: Mode.MENU,
        showSelectedItem: true,
        items: data2,
        label: "Menu mode",
        popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: print,
        selectedItem: data2[0]);
  }
}
