import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IssueButton extends StatefulWidget {
  IssueButton(
      {Key? key,
      required this.name,
      required this.name2,
      required this.buttonname1,
      required this.buttonname2})
      : super(key: key);
  final String name;
  final String name2;
  final String buttonname1;
  final String buttonname2;

  @override
  _IssueButtonState createState() => _IssueButtonState();
}

class _IssueButtonState extends State<IssueButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE6E6E6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff2F4C5A), // background
              // onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              Get.toNamed(widget.name);
            },
            child: Text(widget.buttonname1),
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xff71838D)),
            onPressed: () {
              Get.toNamed(widget.name2);
            },
            child: Text(widget.buttonname2),
          ),
        ],
      ),
    );
  }
}
