import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;

  TitleText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
    );
  }
}
