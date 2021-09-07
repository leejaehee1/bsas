import 'package:flutter/material.dart';


class UserInfoEdit extends StatefulWidget {
  @override
  _UserInfoEditState createState() => _UserInfoEditState();
}

class _UserInfoEditState extends State<UserInfoEdit> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('프로필 편집',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
