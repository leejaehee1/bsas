import 'package:flutter/material.dart';

import 'emergency_page.dart';

class PersonPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
              Container(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      //leading: Icon(Icons.add),
                      title: Text('title'),
                      subtitle: Text('subtitle'),
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
              SizedBox(height: 2),
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
              Container(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      //leading: Icon(Icons.add),
                      title: Text('title'),
                      subtitle: Text('subtitle'),
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
              // 검색
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
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
              // 긴급 호출 버튼 및 페이지 연결
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => EmergencyPage()));
                },
                child: Container(
                  padding: EdgeInsets.only(left: 30),
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5,5)
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
            ],
          ),
        )
    );
  }
}