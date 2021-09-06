import 'package:bsas/center/center_home_screen.dart';
import 'package:bsas/hospital/hospital_home_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bsas/User/user_home_screen.dart';

class TalkPage_first extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView(
    physics: ClampingScrollPhysics(),
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 25, top: 50),
        child: Text(
          '활동 내용',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      SizedBox(height: 10),
      Container(
        // height: 220,
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    // height: 64, // 픽셀 에러로 삭제
                    child: Column(
                      children: [
                        MaterialButton(
                          elevation: 0.0,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                          },
                          color: Color(0xFFDCEDC8),
                          child: Icon(
                            Icons.people_alt_rounded, color: Colors.red[300],
                            size: 30,
                          ),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '지인등록',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                                ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    // height: 64, // 픽셀 에러로 삭제
                    child: Column(
                      children: [
                        MaterialButton(
                          elevation: 0.0,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> CenHomeScreen()));
                          },
                          color: Color(0xFFDCEDC8),
                          child: Icon(
                            Icons.add_alert, color: Colors.red,
                            size: 30,
                          ),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '센터등록',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    // height: 64, // 픽셀 에러로 삭제
                    child: Column(
                      children: [
                        MaterialButton(
                          elevation: 0.0,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => HosHomeScreen()));
                          },
                          color: Color(0xFFDCEDC8),
                          child: Icon(
                            Icons.mark_chat_unread_rounded, color: Colors.blueAccent,
                            size: 30,
                          ),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '병원등록',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    // height: 64, // 픽셀 에러로 삭제
                    child: Column(
                      children: [
                        MaterialButton(
                          elevation: 0.0,
                          onPressed: (){},
                          color: Color(0xFFDCEDC8),
                          child: Icon(
                            Icons.alarm_add_rounded, color: Colors.orange,
                            size: 30,
                          ),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '알람설정',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    // height: 64, // 픽셀 에러로 삭제
                    child: Column(
                      children: [
                        MaterialButton(
                          elevation: 0.0,
                          onPressed: (){},
                          color: Color(0xFFDCEDC8),
                          child: Icon(
                            Icons.location_on_rounded, color: Colors.red,
                            size: 30,
                          ),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '센터찾기',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    // height: 64, // 픽셀 에러로 삭제
                    child: Column(
                      children: [
                        MaterialButton(
                          elevation: 0.0,
                          onPressed: (){},
                          color: Color(0xFFDCEDC8),
                          child: Icon(
                            Icons.add_alert, color: Colors.red,
                            size: 30,
                          ),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '경보사례',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    // height: 64, // 픽셀 에러로 삭제
                    child: Column(
                      children: [
                        MaterialButton(
                          elevation: 0.0,
                          onPressed: (){},
                          color: Color(0xFFDCEDC8),
                          child: Icon(
                            Icons.mark_chat_unread_rounded, color: Colors.blueAccent,
                            size: 30,
                          ),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '메세지설정',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //자가 진단 그래프 구현
            Padding(
              padding: EdgeInsets.only(left: 25, top: 50),
              child: Text(
                '자가 진단',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

          ],
        ),
      )
    ],
  );
}