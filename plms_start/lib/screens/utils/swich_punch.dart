import 'package:flutter/material.dart';

import 'package:flutter_switch/flutter_switch.dart';

class SwitchButton extends StatefulWidget {
  SwitchButton({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.name),
        FlutterSwitch(
          width: 50.0,
          height: 25.0,
          valueFontSize: 15.0,
          toggleSize: 10.0,
          value: status,
          borderRadius: 30.0,
          // padding: 3.0,
          showOnOff: true,
          onToggle: (val) {
            setState(() {
              status = val;
            });
          },
        ),
      ],
    );
  }
}

// class SwitchButton extends StatefulWidget {
//   SwitchButton({Key? key, required this.name}) : super(key: key);
//   final String name;

//   @override
//   _SwitchButtonState createState() => _SwitchButtonState();
// }

// class _SwitchButtonState extends State<SwitchButton> {
//   bool isSwitched = true;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(widget.name),
//         Switch(
//           value: isSwitched,
//           onChanged: (value) {
//             setState(() {
//               isSwitched = value;
//               print(isSwitched);
//             });
//           },
//           activeTrackColor: Colors.yellow,
//           activeColor: Colors.orangeAccent,
//         ),
//       ],
//     );
//   }
// }
