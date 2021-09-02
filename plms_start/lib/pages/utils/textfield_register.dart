import 'package:flutter/material.dart';

class TextFieldRegister extends StatefulWidget {
  final String title;

  TextFieldRegister({Key? key, required this.title}) : super(key: key);

  @override
  _TextFieldRegisterState createState() => _TextFieldRegisterState();
}

class _TextFieldRegisterState extends State<TextFieldRegister> {
  final _txTextEditController = TextEditingController();

  @override
  void dispose() {
    _txTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(widget.title)),
        SizedBox(
          width: 200,
          height: 30,
          child: TextField(
            controller: _txTextEditController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              print(text);
            },
          ),
        ),
      ],
    );
  }
}
