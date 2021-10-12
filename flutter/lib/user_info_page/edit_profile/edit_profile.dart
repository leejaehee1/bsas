import 'package:flutter/material.dart';


class EditProfileDetail extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_rounded),
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
