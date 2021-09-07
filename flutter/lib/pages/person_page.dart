import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'emergency_page.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {

  String videoPath1 = "https://www.youtube.com/watch?v=TUb18LDlt8M";
  String videoId1 = "TUb18LDlt8M";
  String videoPath2 = "https://www.youtube.com/watch?v=f1d6KvWemdI";
  String videoId2 = "f1d6KvWemdI";
  String videoPath3 = "https://www.youtube.com/watch?v=lmOFnyYQO7s";
  String videoId3 = "lmOFnyYQO7s";

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          // scrollDirection: Axis.vertical,
          // padding: EdgeInsets.only(left: 16, top: 30, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Text(
                  "현재 활동",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 3),
              //차트
              AspectRatio(
                aspectRatio: 1.70,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Color(0xff232d37)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child: LineChart(
                      showAvg ? avgData() : mainData(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 34,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showAvg = !showAvg;
                    });
                  },
                  child: Text(
                    'avg',
                    style: TextStyle(
                        fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
                  ),
                ),
              ),
              // SizedBox(height: 2),
              Container(
                margin: EdgeInsets.only(left: 130),
                child: Text(
                  "심박수/혈압 그래프",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black
                  ),
                ),
              ),//서브 타이블 작성란
              SizedBox(height: 50),
              //차트
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
                child: Text(
                  "오늘의 위험 지수",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 3),
              AspectRatio(
                aspectRatio: 1.70,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Color(0xff232d37)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child: LineChart(
                      showAvg ? subAvgData() : subData(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 34,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showAvg = !showAvg;
                    });
                  },
                  child: Text(
                    'avg',
                    style: TextStyle(
                        fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 2),
              Container(
                margin: EdgeInsets.only(left: 170),
                child: Text(
                  "발병확률",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
                child: Text(
                  "오늘의 이벤트",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      title: Text("1. 건강 목표 도달 이벤트 \n "
                          "2. 건강 체크 이벤트 \n"
                          "3. 사전 예약 이벤트",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                    elevation: 2,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
                child: Text(
                  "오늘의 헤드라인",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      //leading: Icon(Icons.add),
                      title: Text('1. 강추위에 뇌졸중 환자 급증\n 2. 뇌졸중에 좋은 보양 음식 추천 \n 3. 최근 10년간 뇌졸중 발병 추이 분석'),
                    ),
                    elevation: 2,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
                child: Text(
                  "추천 활동",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      //leading: Icon(Icons.add),
                      title: Text('동지에는 좋은 음식을 먹고 좋은 활동을 하면 \n 좋은 건강을 유지한다고 믿었기에  \n 좋은 장소에서 사람들과 함께 좋은 음식을 먹으면 좋습니다.'),
                    ),
                    elevation: 2,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              //유튜브 채널
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
                child: Text(
                  "YOUTUBE 인기채널", //TEXT간 색상 다르게, YOUTUBE는 빨간색으로 강조
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                // height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              YoutubePlayer(
                                width: 150,
                                controller: YoutubePlayerController(
                                    initialVideoId: videoId1,
                                    flags: YoutubePlayerFlags(
                                        autoPlay: false, mute: false)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '의학채널 비온뒤',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '[인사이트 인터뷰] #18 \n‘뇌졸중’..',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '2021-8-7',
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              YoutubePlayer(
                                width: 150,
                                controller: YoutubePlayerController(
                                    initialVideoId: videoId2,
                                    flags: YoutubePlayerFlags(
                                        autoPlay: false, mute: false)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '한양대학교병원',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '뇌졸중 전조증상 알면,\n골든..',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '2020-2-17',
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              YoutubePlayer(
                                width: 150,
                                controller: YoutubePlayerController(
                                    initialVideoId: videoId3,
                                    flags: YoutubePlayerFlags(
                                        autoPlay: false, mute: false)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '카테고리',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '동영상 제목',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '일자',
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    elevation: 2,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                  ),

                ),
              ),
              // 긴급 호출 버튼 및 페이지 연결
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => EmergencyPage()));
                },
                child: Container(
                  // width: 300,
                  height: 60,
                  margin:EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: Offset(2,5)
                      ),
                    ]
                  ),
                  child: Center(
                    child: Text(
                      "긴급호출",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10)
            ],
          ),
        )
    );
  }


  // 차트
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 5:
                return '5min';
              case 10:
                return '10min';
              case 15:
                return '15min';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              //bpm
              case 50:
                return '50';
              case 100:
                return '100';
              case 150:
                return '150';
              case 200:
                return '200';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 20,
      minY: 0,
      maxY: 220,
      lineBarsData: [
        LineChartBarData(
          // 데이터 넣기
          spots: [
            FlSpot(0, 81),
            FlSpot(2.6, 90),
            FlSpot(4.9, 77),
            FlSpot(6.8, 98),
            FlSpot(8, 78),
            FlSpot(9.5, 100),
            FlSpot(11, 65),
            FlSpot(13, 90),
            FlSpot(14.2, 77),
            FlSpot(15.6, 98),
            FlSpot(16.5, 100),
            FlSpot(18, 78),
            FlSpot(19, 180),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 5:
                return '5min';
              case 10:
                return '10min';
              case 15:
                return '15min';
            }
            return '';
          },
          margin: 8,
          interval: 1,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 50:
                return '50';
              case 100:
                return '100';
              case 150:
                return '150';
              case 200:
                return '200';
            }
            return '';
          },
          reservedSize: 32,
          interval: 1,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      // 분 단위로 나눔 x, 심박수 y
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 81),
            FlSpot(2.6, 90),
            FlSpot(4.9, 77),
            FlSpot(6.8, 98),
            FlSpot(8, 78),
            FlSpot(9.5, 100),
            FlSpot(11, 65),
            FlSpot(13, 90),
            FlSpot(14.2, 77),
            FlSpot(15.6, 98),
            FlSpot(16.5, 100),
            FlSpot(18, 78),
            FlSpot(19, 180),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
  LineChartData subData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 5:
                return '5min';
              case 10:
                return '10min';
              case 15:
                return '15min';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
            //bpm
              case 50:
                return '50';
              case 100:
                return '100';
              case 150:
                return '150';
              case 200:
                return '200';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 20,
      minY: 0,
      maxY: 220,
      lineBarsData: [
        LineChartBarData(
          // 데이터 넣기
          spots: [
            FlSpot(0, 47),
            FlSpot(1, 50),
            FlSpot(2, 55),
            FlSpot(3, 64),
            FlSpot(4, 75),
            FlSpot(5, 88),
            FlSpot(6, 92),
            FlSpot(7, 97),
            FlSpot(8, 105),
            FlSpot(9, 112),
            FlSpot(10, 117),
            FlSpot(11, 125),
            FlSpot(12, 124),
            FlSpot(13, 120),
            FlSpot(14, 128),
            FlSpot(15, 131),
            FlSpot(16, 141),
            FlSpot(17, 149),
            FlSpot(18, 151),
            FlSpot(19, 142),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
  LineChartData subAvgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 5:
                return '5min';
              case 10:
                return '10min';
              case 15:
                return '15min';
            }
            return '';
          },
          margin: 8,
          interval: 1,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 50:
                return '50';
              case 100:
                return '100';
              case 150:
                return '150';
              case 200:
                return '200';
            }
            return '';
          },
          reservedSize: 32,
          interval: 1,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      // 분 단위로 나눔 x, 심박수 y
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 47),
            FlSpot(1, 50),
            FlSpot(2, 55),
            FlSpot(3, 64),
            FlSpot(4, 75),
            FlSpot(5, 88),
            FlSpot(6, 92),
            FlSpot(7, 97),
            FlSpot(8, 105),
            FlSpot(9, 112),
            FlSpot(10, 117),
            FlSpot(11, 125),
            FlSpot(12, 124),
            FlSpot(13, 120),
            FlSpot(14, 128),
            FlSpot(15, 131),
            FlSpot(16, 141),
            FlSpot(17, 149),
            FlSpot(18, 151),
            FlSpot(19, 142),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}


