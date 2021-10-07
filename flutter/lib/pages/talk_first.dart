import 'package:bsas/center/center_home_screen.dart';
import 'package:bsas/hospital/hospital_home_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bsas/User/user_home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chat_page.dart';

class TalkPageFirst extends StatefulWidget {
  const TalkPageFirst({Key? key}) : super(key: key);

  @override
  _TalkPageFirststate createState() => _TalkPageFirststate();
}

class _TalkPageFirststate extends State<TalkPageFirst> {
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  late List<BarChartGroupData> rawPopulationGroups;
  late List<BarChartGroupData> showingPopulationGroups;

  late List<BarChartGroupData> rawPerson;
  late List<BarChartGroupData> showingPerson;

  int touchedGroupIndex = -1;

  bool showAvg = false;

  @override
  // chart data 자가진단
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 5);
    final barGroup7 = makeGroupData(6, 10, 6);

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

    // chart data 인구통계

    final populationGroup1 = populationData(0, 5, 12);
    final populationGroup2 = populationData(1, 16, 12);
    final populationGroup3 = populationData(2, 18, 5);
    final populationGroup4 = populationData(3, 20, 16);
    final populationGroup5 = populationData(4, 17, 6);
    final populationGroup6 = populationData(5, 19, 5);
    final populationGroup7 = populationData(6, 10, 6);

    final populationitems = [
      populationGroup1,
      populationGroup2,
      populationGroup3,
      populationGroup4,
      populationGroup5,
      populationGroup6,
      populationGroup7,
    ];

    rawPopulationGroups = populationitems;

    showingPopulationGroups = rawPopulationGroups;

    final person1 = personData(0, 5, 12);
    final person2 = personData(1, 16, 12);
    final person3 = personData(2, 18, 5);
    final person4 = personData(3, 20, 16);
    final person5 = personData(4, 17, 6);
    final person6 = personData(5, 19, 5);
    final person7 = personData(6, 10, 6);

    final personItems = [
      person1,
      person2,
      person3,
      person4,
      person5,
      person6,
      person7,
    ];

    rawPerson = personItems;

    showingPerson = rawPerson;
  }
  // url_launcher


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        child: const Icon(Icons.mark_chat_unread_rounded),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          const Padding(
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
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: <Widget>[
                Container(
                  height: 280,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        children: [
                          const SizedBox(height: 25),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.only(left: 16),
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
                                    color: const Color(0xFFDCEDC8),
                                    child: Icon(
                                      Icons.people_alt_rounded,
                                      color: Colors.red[300],
                                      size: 30,
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    shape: const CircleBorder(),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '지인등록',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.only(left: 16),
                              // height: 64, // 픽셀 에러로 삭제
                              child: Column(
                                children: [
                                  MaterialButton(
                                    elevation: 0.0,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => CenterHomeScreen()));
                                    },
                                    color: const Color(0xFFDCEDC8),
                                    child: const Icon(
                                      Icons.apartment_rounded,
                                      color: Colors.pink,
                                      size: 30,
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    shape: const CircleBorder(),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '센터등록',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.only(left: 16),
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
                                    color: const Color(0xFFDCEDC8),
                                    child: const Icon(
                                      Icons.local_hospital_rounded,
                                      color: Colors.deepOrangeAccent,
                                      size: 30,
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    shape: const CircleBorder(),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '병원등록',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.only(left: 16),
                              // height: 64, // 픽셀 에러로 삭제
                              child: Column(
                                children: const [
                                  MaterialButton(
                                    elevation: 0.0,
                                    onPressed: _launchCenterUrl,
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
                                  Text(
                                    '센터찾기',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.only(left: 16),
                              // height: 64, // 픽셀 에러로 삭제
                              child: Column(
                                children: const [
                                  MaterialButton(
                                    elevation: 0.0,
                                    onPressed: _launchHospitalUrl,
                                    color: Color(0xFFDCEDC8),
                                    child: Icon(
                                      Icons.add_alert_rounded,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(16),
                                    shape: CircleBorder(),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '병원찾기',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.only(left: 16),
                              // height: 64, // 픽셀 에러로 삭제
                              child: Column(
                                children: const [
                                  MaterialButton(
                                    elevation: 0.0,
                                    onPressed: _launchMedicineUrl,
                                    color: Color(0xFFDCEDC8),
                                    child: Icon(
                                      Icons.sick_rounded,
                                      color: Colors.blueAccent,
                                      size: 30,
                                    ),
                                    padding: EdgeInsets.all(16),
                                    shape: CircleBorder(),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '약국찾기',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]
                    ),
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(0,3),
                        )
                      ]
                  ),
                ),
                const SizedBox(height: 20),
                // 자가 진단
                AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    color: const Color(0xFF2d365c),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              makeTransactionsIcon(),
                              const SizedBox(
                                width: 38,
                              ),
                              const Text(
                                '자가진단',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Expanded(
                            child: BarChart(
                              BarChartData(
                                maxY: 20,
                                barTouchData: BarTouchData(
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey,
                                      getTooltipItem: (_a, _b, _c, _d) => null,
                                    ),
                                    touchCallback:
                                        (FlTouchEvent event, response) {
                                      if (response == null ||
                                          response.spot == null) {
                                        setState(() {
                                          touchedGroupIndex = -1;
                                          showingBarGroups =
                                              List.of(rawBarGroups);
                                        });
                                        return;
                                      }
                                      touchedGroupIndex =
                                          response.spot!.touchedBarGroupIndex;
                                      setState(() {
                                        if (!event
                                            .isInterestedForInteractions) {
                                          touchedGroupIndex = -1;
                                          showingBarGroups =
                                              List.of(rawBarGroups);
                                          return;
                                        }
                                        showingBarGroups =
                                            List.of(rawBarGroups);
                                        if (touchedGroupIndex != -1) {
                                          var sum = 0.0;
                                          for (var rod in showingBarGroups[
                                                  touchedGroupIndex]
                                              .barRods) {
                                            sum += rod.y;
                                          }
                                          final avg = sum /
                                              showingBarGroups[
                                                      touchedGroupIndex]
                                                  .barRods
                                                  .length;

                                          showingBarGroups[touchedGroupIndex] =
                                              showingBarGroups[
                                                      touchedGroupIndex]
                                                  .copyWith(
                                            barRods: showingBarGroups[
                                                    touchedGroupIndex]
                                                .barRods
                                                .map((rod) {
                                              return rod.copyWith(y: avg);
                                            }).toList(),
                                          );
                                        }
                                      });
                                    }),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: SideTitles(showTitles: false),
                                  topTitles: SideTitles(showTitles: false),
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) =>
                                        const TextStyle(
                                            color: Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                    margin: 20,
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return 'Mn';
                                        case 1:
                                          return 'Te';
                                        case 2:
                                          return 'Wd';
                                        case 3:
                                          return 'Tu';
                                        case 4:
                                          return 'Fr';
                                        case 5:
                                          return 'St';
                                        case 6:
                                          return 'Sn';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) =>
                                        const TextStyle(
                                            color: Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                    margin: 8,
                                    reservedSize: 28,
                                    interval: 1,
                                    getTitles: (value) {
                                      if (value == 0) {
                                        return '0bpm';
                                      } else if (value == 5) {
                                        return '50bpm';
                                      } else if (value == 10) {
                                        return '100bpm';
                                      } else if (value == 15) {
                                        return '150bpm';
                                      } else {
                                        return '';
                                      }
                                    },
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: showingBarGroups,
                                gridData: FlGridData(show: false),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // 인구통계
                AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    color: const Color(0xFF2d365c),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              makeTransactionsIcon(),
                              const SizedBox(
                                width: 38,
                              ),
                              const Text(
                                '인구통계',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Expanded(
                            child: BarChart(
                              BarChartData(
                                maxY: 20,
                                barTouchData: BarTouchData(
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey,
                                      getTooltipItem: (_a, _b, _c, _d) => null,
                                    ),
                                    touchCallback:
                                        (FlTouchEvent event, response) {
                                      if (response == null ||
                                          response.spot == null) {
                                        setState(() {
                                          touchedGroupIndex = -1;
                                          showingPopulationGroups =
                                              List.of(rawPopulationGroups);
                                        });
                                        return;
                                      }
                                      touchedGroupIndex =
                                          response.spot!.touchedBarGroupIndex;
                                      setState(() {
                                        if (!event
                                            .isInterestedForInteractions) {
                                          touchedGroupIndex = -1;
                                          showingPopulationGroups =
                                              List.of(rawPopulationGroups);
                                          return;
                                        }
                                        showingPopulationGroups =
                                            List.of(rawPopulationGroups);
                                        if (touchedGroupIndex != -1) {
                                          var sum = 0.0;
                                          for (var rod
                                              in showingPopulationGroups[
                                                      touchedGroupIndex]
                                                  .barRods) {
                                            sum += rod.y;
                                          }
                                          final avg = sum /
                                              showingPopulationGroups[
                                                      touchedGroupIndex]
                                                  .barRods
                                                  .length;

                                          showingPopulationGroups[
                                                  touchedGroupIndex] =
                                              showingPopulationGroups[
                                                      touchedGroupIndex]
                                                  .copyWith(
                                            barRods: showingPopulationGroups[
                                                    touchedGroupIndex]
                                                .barRods
                                                .map((rod) {
                                              return rod.copyWith(y: avg);
                                            }).toList(),
                                          );
                                        }
                                      });
                                    }),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: SideTitles(showTitles: false),
                                  topTitles: SideTitles(showTitles: false),
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) =>
                                        const TextStyle(
                                            color: Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                    margin: 20,
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return 'Mn';
                                        case 1:
                                          return 'Te';
                                        case 2:
                                          return 'Wd';
                                        case 3:
                                          return 'Tu';
                                        case 4:
                                          return 'Fr';
                                        case 5:
                                          return 'St';
                                        case 6:
                                          return 'Sn';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) =>
                                        const TextStyle(
                                            color: Color(0xff7589a2),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                    margin: 8,
                                    reservedSize: 28,
                                    interval: 1,
                                    getTitles: (value) {
                                      if (value == 0) {
                                        return '0bpm';
                                      } else if (value == 5) {
                                        return '50bpm';
                                      } else if (value == 10) {
                                        return '100bpm';
                                      } else if (value == 15) {
                                        return '150bpm';
                                      } else {
                                        return '';
                                      }
                                    },
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: showingPopulationGroups,
                                gridData: FlGridData(show: false),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // 나의 진료 내역
                AspectRatio(
                  aspectRatio: 1,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    color: const Color(0xFF2d365c),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              makeTransactionsIcon(),
                              const SizedBox(
                                width: 38,
                              ),
                              const Text(
                                'MY진료내역',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Expanded(
                            child: BarChart(
                              BarChartData(
                                maxY: 20,
                                barTouchData: BarTouchData(
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey,
                                      getTooltipItem: (_a, _b, _c, _d) => null,
                                    ),
                                    touchCallback:
                                        (FlTouchEvent event, response) {
                                      if (response == null ||
                                          response.spot == null) {
                                        setState(() {
                                          touchedGroupIndex = -1;
                                          showingPerson = List.of(rawPerson);
                                        });
                                        return;
                                      }
                                      touchedGroupIndex =
                                          response.spot!.touchedBarGroupIndex;
                                      setState(() {
                                        if (!event
                                            .isInterestedForInteractions) {
                                          touchedGroupIndex = -1;
                                          showingPerson = List.of(rawPerson);
                                          return;
                                        }
                                        showingPerson = List.of(rawPerson);
                                        if (touchedGroupIndex != -1) {
                                          var sum = 0.0;
                                          for (var rod in showingPerson[
                                                  touchedGroupIndex]
                                              .barRods) {
                                            sum += rod.y;
                                          }
                                          final avg = sum /
                                              showingPerson[touchedGroupIndex]
                                                  .barRods
                                                  .length;

                                          showingPerson[touchedGroupIndex] =
                                              showingPerson[touchedGroupIndex]
                                                  .copyWith(
                                            barRods:
                                                showingPerson[touchedGroupIndex]
                                                    .barRods
                                                    .map((rod) {
                                              return rod.copyWith(y: avg);
                                            }).toList(),
                                          );
                                        }
                                      });
                                    }),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: SideTitles(showTitles: false),
                                  topTitles: SideTitles(showTitles: false),
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) =>
                                        const TextStyle(
                                            color: Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                    margin: 20,
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return '1월';
                                        case 1:
                                          return '2월';
                                        case 2:
                                          return '3월';
                                        case 3:
                                          return '4월';
                                        case 4:
                                          return '5월';
                                        case 5:
                                          return '6월';
                                        case 6:
                                          return '7월';
                                        case 7:
                                          return '8월';
                                        case 8:
                                          return '9월';
                                        case 9:
                                          return '10월';
                                        case 10:
                                          return '11월';
                                        case 11:
                                          return '12월';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) =>
                                        const TextStyle(
                                            color: Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                    margin: 8,
                                    reservedSize: 28,
                                    interval: 1,
                                    getTitles: (value) {
                                      if (value == 0) {
                                        return '0회';
                                      } else if (value == 5) {
                                        return '3회';
                                      } else if (value == 10) {
                                        return '5회';
                                      } else if (value == 15) {
                                        return '10회';
                                      } else {
                                        return '';
                                      }
                                    },
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: showingPerson,
                                gridData: FlGridData(show: false),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 자가진단 그래프
BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      y: y1,
      colors: [Colors.blueAccent],
      width: 7,
    ),
    BarChartRodData(
      y: y2,
      colors: [const Color(0xffff5182)],
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

// 인구통계 그래프
BarChartGroupData populationData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      y: y1,
      colors: [Colors.green],
      width: 7,
    ),
    BarChartRodData(
      y: y2,
      colors: [Colors.amber],
      width: 7,
    ),
  ]);
}

Widget populationTransactionsIcon() {
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

// 개인 진료 내역 그래프
BarChartGroupData personData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      y: y1,
      colors: [Colors.deepPurple],
      width: 7,
    ),
    BarChartRodData(
      y: y2,
      colors: [Colors.yellow],
      width: 7,
    ),
  ]);
}

Widget personTransactionsIcon() {
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

//url_launcher
// 센터 찾기
_launchCenterUrl() async {
  const _centerUrl = 'https://map.naver.com/v5/search/%EC%9A%94%EC%96%91%EC%84%BC%ED%84%B0?c=14140528.5032531,4513331.8124654,15,0,0,0,dh';
  if (await canLaunch(_centerUrl)) {
    await launch(_centerUrl);
  } else {
    throw 'Could not launch $_centerUrl';
  }
}
// 병원찾기
_launchHospitalUrl() async {
  const _hospitalUrl = 'https://map.naver.com/v5/search/%EB%87%8C%EC%A1%B8%EC%A4%91%EB%B3%91%EC%9B%90?c=14138829.3893373,4515250.8841434,15,0,0,0,dh';
  if (await canLaunch(_hospitalUrl)) {
    await launch(_hospitalUrl);
  } else {
    throw 'Could not launch $_hospitalUrl';
  }
}
// 약국찾기
_launchMedicineUrl() async {
  const _medicineUrl = 'https://map.naver.com/v5/search/%EC%95%BD%EA%B5%AD?c=14138829.3893373,4515250.8841434,15,0,0,0,dh';
  if (await canLaunch(_medicineUrl)) {
    await launch(_medicineUrl);
  } else {
    throw 'Could not launch $_medicineUrl';
  }
}
