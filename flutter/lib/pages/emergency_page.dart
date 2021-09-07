import 'package:bsas/pages/person_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../navigate_page.dart';

class EmergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.alarm_rounded,
                          size: 80,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '위험 탐지 알람',
                          style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 320,
                      child: Text(
                        '사용자 누구누구가 어느 위치에서 마지막으로 위험상황이 감지되어 알람을 울립니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      margin: EdgeInsets.all(15),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 170,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '병원 : 어디어디 병원',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '센터 : 어디어디 센터 담당자',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '지인 : 홍길동, 허난설헌',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 320,
                      child: Text(
                        '알람이 전송되었으며, 확인을 요청하고있습니다. 확인이 되면 알람을 꺼 주시길 바랍니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '타이머',
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 300,
                      height: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: 0.6,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                          backgroundColor: Color(0xffD6D6D6),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> NavigatorPage()));
                      },
                      child: Text('알람 종료'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 40),
                        primary: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}