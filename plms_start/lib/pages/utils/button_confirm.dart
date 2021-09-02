import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../punch_screen.dart';

class ConfirmButton extends StatefulWidget {
  ConfirmButton(
      {Key? key,
      // required this.name,
      required this.buttonname1,
      required this.buttonname2})
      : super(key: key);
  // String name;
  final String buttonname1;
  final String buttonname2;

  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
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
              primary: Color(0xff71838D),
            ),
            onPressed: () {
              _showDialog('/home');
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
              Get.offAllNamed("/home");
            },
            child: Text(widget.buttonname2),
          ),
        ],
      ),
    );
  }

  void _showDialog(String page) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text(
              "Are you sure you want to Cancel? \n Changes that you made may not be saved"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff71838D),
                  ),
                  child: new Text("No"),
                  onPressed: () {
                    Get.back();
                  },
                ),
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2F4C5A), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  child: new Text("Yes"),
                  onPressed: () {
                    setState(() {});
                    Get.toNamed(page);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
