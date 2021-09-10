import 'package:flutter/material.dart';


class SearchCenterPage extends StatefulWidget {
  @override
  _SearchCenterPageState createState() => _SearchCenterPageState();
}

class _SearchCenterPageState extends State<SearchCenterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('센터찾기',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
