import 'package:flutter/material.dart';

import 'tagging_punch.dart';

class TaggingButton extends StatelessWidget {
  TaggingButton({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(name),
          // color: Colors.yellow,
        ),
        SizedBox(
          width: 45,
        ),
        Container(
          child: TaggingWidget(),
          // color: Colors.white,
        ),
      ],
    );
  }
}
