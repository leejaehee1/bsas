import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../punch_screen.dart';

class SuccessButton extends StatefulWidget {
  SuccessButton(
      {Key? key,
      // required this.name,
      required this.buttonname1,
      required this.buttonname2})
      : super(key: key);
  // String name;
  final String buttonname1;
  final String buttonname2;

  @override
  _SuccessButtonState createState() => _SuccessButtonState();
}

class _SuccessButtonState extends State<SuccessButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFffffff),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff71838D),
            ),
            onPressed: () {
              Get.offAllNamed('/home');
            },
            child: Text(widget.buttonname1),
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff2F4C5A), // background
              // onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              Get.offAllNamed('/punchList');
            },
            child: Text(widget.buttonname2),
          ),
        ],
      ),
    );
  }
}
