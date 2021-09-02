import 'package:flutter/material.dart';

class CheckBoxButton2 extends StatefulWidget {
  CheckBoxButton2({Key? key}) : super(key: key);

  @override
  _CheckBoxButton2State createState() => _CheckBoxButton2State();
}

class _CheckBoxButton2State extends State<CheckBoxButton2> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        SizedBox(
          width: 90,
          child: Text('Yes, I agree'),
        ),
      ],
    );
  }
}
