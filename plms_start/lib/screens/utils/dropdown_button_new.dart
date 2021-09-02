import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class Newbutton extends StatefulWidget {
  Newbutton({Key? key}) : super(key: key);

  @override
  _NewbuttonState createState() => _NewbuttonState();
}

class _NewbuttonState extends State<Newbutton> {
  List<String> data = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: DropdownSearch<String>(
          onSaved: print,
          showSearchBox: true,
          mode: Mode.MENU,
          showSelectedItem: true,
          items: data,
          label: "Menu mode",
          hint: "country in menu mode",
          popupItemDisabled: (String s) => s.startsWith('I'),
          onChanged: print,
          selectedItem: data[0]),
    );
  }
}
