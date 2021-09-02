import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropboxText5 extends StatefulWidget {
  final String text;

  DropboxText5({Key? key, required this.text}) : super(key: key);

  @override
  _DropboxText5State createState() => _DropboxText5State();
}

class _DropboxText5State extends State<DropboxText5> {
  List<String> data = Get.arguments[2];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(widget.text),
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
        items: data,
        label: "Menu mode",
        popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: print,
        selectedItem: data[0]);
  }
}
