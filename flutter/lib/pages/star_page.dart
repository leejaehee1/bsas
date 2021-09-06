import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StarPage extends StatefulWidget {
  @override
  _StarPageState createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  Widget _contanier(String text, String url){
    return Container(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.bottomCenter,
          child: Text(text,
            style: TextStyle(color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.fill
        )
      ),
    );
  }

  Widget _text(String text){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.black,
      ),
    );
  }

  Widget _subTitle(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      ),
    );
  }

  Widget _button(){
    return ElevatedButton(onPressed: (){},
      child: Text('Label',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //google map
          // 커뮤니티
              Container(
                padding: EdgeInsets.only(left: 16, top: 25),
                child: Text(
                  '커뮤니티', //gesture로 page 간 연결 필요
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 3.5/7,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    _contanier('설문/투표', 'image/vote.jpg'),
                    _contanier('우리가게', 'image/market.jpg'),
                    _contanier('공간공유', 'image/space.jpg'),
                    _contanier('지식/재능공유', 'image/share.jpg'),
                  ],
                ),
              ),
              //헬스 투어 정보
              Container(
                padding: EdgeInsets.only(left: 16, top: 25),
                child: Text(
                  '헬스 투어 정보', //gesture로 page 간 연결 필요
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 3.5/7,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    _contanier('설문/투표', 'image/vote.jpg'),
                    _contanier('우리가게', 'image/market.jpg'),
                    _contanier('공간공유', 'image/space.jpg'),
                    _contanier('지식/재능공유', 'image/share.jpg'),
                  ],
                ),
              ),
              //이달의 픽
              Container(
                padding: EdgeInsets.only(left: 16, top: 25),
                child: Text(
                  '이달의 Pick',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'subtitle',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/share.jpg'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _text('테마 별 추천 장소'),
                  SizedBox(height: 10),
                  _subTitle('1. [뚝섬]뚝섬한강공원'),
                  _subTitle('2. [뚝섬]뚝섬한강공원'),
                  _subTitle('3. [뚝섬]뚝섬한강공원'),
                  _subTitle('4. [뚝섬]뚝섬한강공원'),
                  _subTitle('5. [뚝섬]뚝섬한강공원'),
                ],
              ),//
              SizedBox(height: 10),
              Column(
                children: [
                  _text('지금 찾는 키워드'),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         _button(),
                          _button(),
                          _button(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _button(),
                          _button(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _button(),
                          _button(),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              _text('인기 명소 top5'),
              SizedBox(height: 10),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/share.jpg'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _text('나눔 정보'),
                      IconButton(onPressed: (){}, icon: Icon(Icons.add_box_rounded, ))// icon 컬러, size, navigator
                    ],
                  ),
                  SizedBox(height: 10),
                  _subTitle('1. [무료][서울 강남구] 신형 진단 키트 나눔'),
                  _subTitle('2. [무료][서울 강남구] 신형 진단 키트 나눔'),
                  _subTitle('3. [무료][서울 강남구] 신형 진단 키트 나눔'),
                  _subTitle('4. [무료][서울 강남구] 신형 진단 키트 나눔'),
                  _subTitle('5. [무료][서울 강남구] 신형 진단 키트 나눔'),
                ],
              ),
            ],
          ),
        )
    );
  }
}