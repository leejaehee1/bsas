import 'package:flutter/material.dart';

class CompleteComponent extends StatelessWidget {
  const CompleteComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            _textWidget('Category'),
            SizedBox(
              width: 20,
            ),
            _textWidget('aaaa'),
          ],
        ),
        SizedBox(
          width: 60,
        ),
        Row(
          children: [
            _textWidget('Category'),
            SizedBox(
              width: 20,
            ),
            _textWidget('aaaa'),
          ],
        )
      ],
    );
  }

  Widget _textWidget(String data) {
    return Text(
      data,
      style: TextStyle(color: Colors.white),
    );
  }
}
