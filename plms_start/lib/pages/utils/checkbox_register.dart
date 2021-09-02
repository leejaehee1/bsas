import 'package:flutter/material.dart';

class CheckBoxButton extends StatefulWidget {
  CheckBoxButton({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _CheckBoxButtonState createState() => _CheckBoxButtonState();
}

class _CheckBoxButtonState extends State<CheckBoxButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
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
      ],
    );
  }
}
