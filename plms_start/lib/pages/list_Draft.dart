import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:plms_start/pages/components/List_components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListDraft extends StatelessWidget {
  ListDraft({Key? key}) : super(key: key);

  final List<String> data1 = ['data1', 'data2', 'data3', 'asdf', 'asdfas'];
  final List<String> data2 = [
    'data1',
    'data2',
    'data3',
    'asdf',
    '0123456789012345678901234567890123456789012345'
  ];

  @override
  Widget build(BuildContext context) {
    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView.builder(
        itemCount: data1.length,
        itemBuilder: (BuildContext context, int index) {
          return ListComponent(
              title: AppLocalizations.of(context)!.tile2,
              data1: data1[index],
              data2: data2[index],
              colors: 0xff7B3F40);
        },
      ),
    );
  }
}
