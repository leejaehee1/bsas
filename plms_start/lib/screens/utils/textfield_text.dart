import 'package:flutter/material.dart';

class TextFieldText extends StatelessWidget {
  final String text;
  final String hint;

  TextFieldText({Key? key, required this.text, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(text)),
        SizedBox(
          width: 200,
          height: 30,
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: hint,
          )),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    );
  }
}
