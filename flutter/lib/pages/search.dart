import 'package:flutter/material.dart';

// 검색화면 구현
// 검색 키워드, 인기 키워드 검색어 기술
class TalkPageSecond extends StatelessWidget {
  @override

  Widget _text(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.black,
      ),
    );
  }

  Widget _subTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      ),
    );
  }

  Widget _button() {
    return RaisedButton(
      color: Color(0xFF43aa8b),
      onPressed: () {},
      child: Text(
        'Label',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          // padding: EdgeInsets.only(left: 16, top: 30, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Text(
                  "검색",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInformation(hint: '검색어를 입력하세요', icon: Icons.search_rounded),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 25),
                child: Text(
                  "인기 검색 키워드",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                height: 420,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      //leading: Icon(Icons.add),
                      // title: Text('title'),
                      // subtitle: Text('subtitle'),
                    ),
                    // elevation: 2,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }
  Widget _textInformation({Controller, hint, icon}) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0,3),
          )
        ]
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: Controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}