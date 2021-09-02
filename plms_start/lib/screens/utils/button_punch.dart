import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PunchButton extends StatelessWidget {
  PunchButton(
      {Key? key,
      required this.name,
      required this.buttonName1,
      required this.buttonName2})
      : super(key: key);
  final String name;
  final String buttonName1;
  final String buttonName2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE6E6E6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xff71838D)),
            onPressed: () {},
            child: Text(buttonName1),
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
              Get.toNamed(name);
            },
            child: Text(buttonName2),
          ),
        ],
      ),
    );
  }
}
