import 'package:flutter/material.dart';


class ShareSpacePage extends StatefulWidget {
  @override
  _ShareSpacePageState createState() => _ShareSpacePageState();
}

class _ShareSpacePageState extends State<ShareSpacePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('공간공유',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
