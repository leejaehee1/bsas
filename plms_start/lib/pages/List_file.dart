import 'package:flutter/material.dart';
import 'package:plms_start/pages/components/List_components.dart';

class ListFile extends StatelessWidget {
  const ListFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView(
        children: [
          ListComponent(
              title: "", data1: 'data1', data2: "data2", colors: 0xffB88C69),
          ListComponent(
              title: "", data1: 'data1', data2: "data2", colors: 0xffB88C69),
          ListComponent(
              title: "", data1: 'data1', data2: "data2", colors: 0xffB88C69),
          ListComponent(
              title: "", data1: 'data1', data2: "data2", colors: 0xffB88C69),
          ListComponent(
              title: "", data1: 'data1', data2: "data2", colors: 0xffB88C69),
          ListComponent(
              title: "", data1: 'data1', data2: "data2", colors: 0xffB88C69),
        ],
      ),
    );
  }
}
