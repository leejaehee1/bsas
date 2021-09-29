import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  // img 파일일 경우 img파일 경로를 불러오면 됨 예) images(파일명)/image.png(이미지 이름+확장자),
  'http://54.180.102.153:18080/static/mint.PNG',
];

//event_banner ui
final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  '${imgList.indexOf(item)} / ${imgList.length}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();

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

  // 헤드라인 data 불러오기
  List? data;

  Future<dynamic> getHeadline() async {
    var response = await http.get(Uri.parse("http://54.180.102.153:18080/api/todaysHeadline"));
    print("Response : ${response.statusCode}");
    print(response.body);

    setState(() {
      var dataConvertedToJson = json.decode(response.body);
      List result = dataConvertedToJson['headlines'];
      data!.addAll(result);
    });
    return response.body;
  }

  @override
  void initState() {
    super.initState();
    this.getHeadline();
  }

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
              SizedBox(height: 10),
              // banner 넣기
              _eventBanner(context), // image_banner 호출 위젯으로 이동
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  "현재 활동",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 10),
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
              Center(
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
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "오늘의 위험 지수",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 10),
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
              Center(
                child: Text(
                  "발병확률",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
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
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  // 오늘의 헤드라인 widget 불러오기
                  child: Card(

                    child: Center(
                      child: data!.length == 0
                          ? Text(
                        '데이터가 존재하지 않습니다.\n검색해주세요',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                          :  ListView.builder(
                          shrinkWrap: true,
                            padding: EdgeInsets.all(8.0),
                            itemCount: data!.length,
                            // itemCount: _loadedHeadlines == null ? 0 : _loadedHeadlines.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  leading: Image.network(data![index]['image'], width: 50, height: 50),
                                  title: Text(data![index]['title'],)
                              );
                            }
                        ),
                      ),
                    ),
                  ),
                    // child: Card(
                    //   // 오늘의 헤드라인 widget 불러오기
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       // 활동 내역
                    //       ListTile(
                    //         // leading: Icon(Icons.sick_rounded, color: Colors.red),
                    //         leading: Image.network('url'),
                    //         title: Text()
                    //       ),
                    //       ListTile(
                    //         leading: Icon(Icons.zoom_in_rounded, color: Colors.red),
                    //         title: Text('뇌졸중에 좋은 보양 음식 추천'),
                    //       ),
                    //       ListTile(
                    //         leading: Icon(Icons.fact_check, color: Colors.red),
                    //         title: Text('최근 10년간 뇌졸중 발병 추이 분석'),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
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
              Card(
                child: Column(
                  children: [
                    // 활동 내역
                    ListTile(
                      title: Center(child: Text('동지에는 좋은 음식을 먹고 좋은 활동을 하면 \n좋은 건강을 유지한다고 믿었기에  \n좋은 장소에서 사람들과 함께 좋은 음식을 드셔보세요!')),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //유튜브 채널
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "YOUTUBE 인기채널",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
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
                                    '[인사이트 인터뷰] #18 \n‘뇌졸중’',
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
                                    '뇌졸중 전조증상\n알면,골든..',
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
                                    '서울아산병원',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '뇌졸중의 예방과 치료',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '2019.06.25',
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
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
  // event_banner widget
  int _current = 0;
  final CarouselController _bannerController = CarouselController();

 Widget _eventBanner(context) {
   return Column(
     children: [
       Padding(
         padding: EdgeInsets.all(16.0),
         child: Container(
           child: CarouselSlider(
             items: imageSliders,
             carouselController: _bannerController,
             options: CarouselOptions(
               autoPlay: true, // 자동 paly
               enlargeCenterPage: true,
               height: 150, //image 높이 조절
               viewportFraction: 1.0, // 페이지가 차지하는 영역 비율
               // aspectRatio: 2.0,
               onPageChanged: (index, reason){
                 setState(() {
                   _current = index;
                 });
               }
             ),
           ),
         ),
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: imgList.asMap().entries.map((entry) {
           return GestureDetector(
             onTap: () => _bannerController.animateToPage(entry.key),
             child: Container(
               width: 12.0,
               height: 12.0,
               margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
               decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: (Theme.of(context).brightness == Brightness.dark
                       ? Colors.white
                       : Colors.black)
                       .withOpacity(_current == entry.key ? 0.9 : 0.4)),
             ),
           );
         }).toList(),
       ),
     ],
   );
 }

 // todays_headline widget
 //  Widget _buildHeadline(BuildContext context) {
 //   return Card(
 //       child: ListView.builder(
 //         padding: EdgeInsets.all(8.0),
 //         itemCount: _loadedHeadlines == null ? 0 : _loadedHeadlines.length,
 //           itemBuilder: (BuildContext context, index) {
 //           return ListTile(
 //           leading: Image.network(_loadedHeadlines[index]['image']),
 //            title: Text(_loadedHeadlines[index]['title'],
 //           )
 //           // Column(
 //           //   mainAxisSize: MainAxisSize.min,
 //           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 //           );
 //           }
 //           ),
 //     );
 //  }

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
            FlSpot(2, 90),
            FlSpot(3, 77),
            FlSpot(4, 98),
            FlSpot(5, 78),
            FlSpot(6, 100),
            FlSpot(7, 65),
            FlSpot(8, 90),
            FlSpot(9, 77),
            FlSpot(10, 98),
            FlSpot(11, 100),
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