import 'package:bsas/center/center_home_screen.dart';
import 'package:bsas/hospital/hospital_home_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bsas/User/user_home_screen.dart';

class TalkPageFirst extends StatefulWidget {
  @override
  _TalkPageFirststate createState() => _TalkPageFirststate();
}

class _TalkPageFirststate extends State<TalkPageFirst> {
  Color leftBarColor = Color(0xff53fdd7);
  Color rightBarColor = Color(0xffff5182);
  double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

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
          SizedBox(height: 20),
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeScreen()));
                              },
                              color: Color(0xFFDCEDC8),
                              child: Icon(
                                Icons.people_alt_rounded,
                                color: Colors.red[300],
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CenHomeScreen()));
                              },
                              color: Color(0xFFDCEDC8),
                              child: Icon(
                                Icons.apartment_rounded,
                                color: Colors.pink,
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HosHomeScreen()));
                              },
                              color: Color(0xFFDCEDC8),
                              child: Icon(
                                Icons.local_hospital_rounded,
                                color: Colors.deepOrangeAccent,
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
                              onPressed: () {},
                              color: Color(0xFFDCEDC8),
                              child: Icon(
                                Icons.alarm_add_rounded,
                                color: Colors.indigo,
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
                              onPressed: () {},
                              color: Color(0xFFDCEDC8),
                              child: Icon(
                                Icons.location_on_rounded,
                                color: Colors.red,
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
                              onPressed: () {},
                              color: Color(0xFFDCEDC8),
                              child: Icon(
                                Icons.add_alert,
                                color: Colors.red,
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
                              onPressed: () {},
                              color: Color(0xFFDCEDC8),
                              child: Icon(
                                Icons.mark_chat_unread_rounded,
                                color: Colors.blueAccent,
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
                SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: (){

                  },
                  child: Icon(Icons.mark_chat_unread_rounded),
                ),


              ],
            ),
          ),
        ],
      );
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      y: y1,
      colors: [Color(0xff53fdd7)],
      width: 7,
    ),
    BarChartRodData(
      y: y2,
      colors: [Color(0xffff5182)],
      width: 7,
    ),
  ]);
}

Widget makeTransactionsIcon() {
  const width = 4.5;
  const space = 3.5;
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        width: width,
        height: 10,
        color: Colors.white.withOpacity(0.4),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.white.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 42,
        color: Colors.white.withOpacity(1),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.white.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 10,
        color: Colors.white.withOpacity(0.4),
      ),
    ],
  );
}
