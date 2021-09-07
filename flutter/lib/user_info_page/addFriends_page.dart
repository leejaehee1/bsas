import 'package:flutter/material.dart';


class AddFriendsPage extends StatefulWidget {
  @override
  _AddFriendsPageState createState() => _AddFriendsPageState();
}

class _AddFriendsPageState extends State<AddFriendsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('공지사항',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
