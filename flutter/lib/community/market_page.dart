import 'package:flutter/material.dart';


class MarketPage extends StatefulWidget {
  @override
  _MarketPagePageState createState() => _MarketPagePageState();
}

class _MarketPagePageState extends State<MarketPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('우리가게',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
