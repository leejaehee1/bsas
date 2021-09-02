import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  CheckButton({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 85,
          child: Text(widget.name),
        ),
        Checkbox(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value!;
              // print(isSwitched);
            });
          },
          // activeTrackColor: Colors.yellow,
          activeColor: Colors.orangeAccent,
        ),
        Container(
          width: 200,
          height: 30,
          child: TextField(
              enabled: isSwitched,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                // labelText: hint,
              )),
        )
      ],
    );
  }
}
