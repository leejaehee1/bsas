import 'dart:async';
import 'package:bsas/db/monthly_pick_db.dart';
import 'package:bsas/db/recommend_activity_db.dart';
import 'package:bsas/model/monthly_pick.dart';
import 'package:bsas/model/recommend_activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class StarPage extends StatefulWidget {
  const StarPage({Key? key}) : super(key: key);

  @override
  _StarPageState createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late CameraPosition _googleMapCamera;
  Marker? marker;
  LocationData? currentLocation;

  // currentLocation.latitude = 37.66809443;
  // currentLocation.longitude = 126.74454984;

  void _currentLocation() async {
    var location = Location();
    Map<String, double> dataMap = {
      'latitude': 37.66809443,
      'longitude': 126.74454984
    };
    currentLocation = LocationData.fromMap(dataMap);

    currentLocation = await location.getLocation();

    // Map<String, double>();
    // dataMap.putIfAbsent("latitude", 37.66809443);
    // dataMap.putIfAbsent("longitude", 126.74454984);
  }

  // monthly pick 호출
  Future<List<MonthlyPick>> monthlyPick(http.Client client) async {
    final response = await client
        .get(Uri.parse("http://54.180.102.153:18080/api/monthlyPick"));
    return parsePhotos(response.body);
  }

  // recommend activity 호출
  Future<List<RecommendActivity>> recommendActivity(http.Client client) async {
    final response = await client
        .get(Uri.parse("http://54.180.102.153:18080/api/recommendActivity"));
    return recommendAct(response.body);
  }

  @override
  void initState() {
    super.initState();
    monthlyPick(http.Client());
    recommendActivity(http.Client());
  }

  Widget _contanier(String text, String contents, String url, dynamic _url) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Align(
            alignment: Alignment.topLeft,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black87, fontSize: 23, fontWeight: FontWeight.bold),
            )
          ),
            const SizedBox(height: 2),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  contents,
                  style: const TextStyle(
                      color: Color(0xFF487BEA), fontSize: 15, fontWeight: FontWeight.bold),
                )
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(url, width: 50, height: 50,)
            ),
        ]
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF165DC0).withOpacity(0.1), //0xffafdbde
        ),
      ),
      onTap: _url,
    );
  }

  // 수다방 url
  _launchTalk() async{
    const _talkUrl = 'url';
    if (await canLaunch(_talkUrl)) {
      await launch(_talkUrl);
    } else {
      throw 'Could not Launch $_talkUrl';
    }
  }
  // 병원후기 url
  _launchHospital() async{
    const _hospitalUrl = 'url';
    if (await canLaunch(_hospitalUrl)) {
      await launch(_hospitalUrl);
    } else {
      throw 'Could not Launch $_hospitalUrl';
    }
  }
  // 질의응답 url
  _launchQA() async{
    const _QAurl = 'url';
    if (await canLaunch(_QAurl)) {
      await launch(_QAurl);
    } else {
      throw 'Could not Launch $_QAurl';
    }
  }
  // 의사정보 url
  _launchDoctor() async{
    const _doctorUrl = 'https://github.com/leejaehee1/bsas/blob/master/flutter/lib/pages/star_page.dart'; //test url
    if (await canLaunch(_doctorUrl)) {
      await launch(_doctorUrl);
    } else {
      throw 'Could not Launch $_doctorUrl';
    }
  }


  Widget _text(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.black,
      ),
    );
  }

  Widget _subTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      ),
    );
  }

  Widget _button() {
    return RaisedButton(
      color: const Color(0xFF43aa8b),
      onPressed: () {},
      child: const Text(
        'Label',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _recommendPlace(String text, String image, String imgUrl, dynamic url) {
    return InkWell(
          child: GridTile(
            child: FadeInImage(
              placeholder: AssetImage(image),
              image: AssetImage(imgUrl),
              fit: BoxFit.fill,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
            ),
          ),
        onTap: url,
    );
  }

  @override
  Widget build(BuildContext context) {
    _currentLocation();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //google map
              Container(
                padding: const EdgeInsets.only(left: 16, top: 25),
                child: const Text(
                  '스마트 맵',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 3.5 / 7,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    // LatLng(37.66809443, 126.74454984),
                    zoom: 16,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: Set<Marker>.of(markers.values),
                ),
              ),
              //////////////////////Googlemap end
              // 커뮤니티
              Container(
                padding: const EdgeInsets.only(left: 16, top: 25),
                child: const Text(
                  '정보가 필요하신가요?', //gesture로 page 간 연결 필요
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 3.5 / 7,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    _contanier('수다방', 'contents', 'image/speech-bubble.png', _launchTalk),
                    _contanier('병원후기', 'contents', 'image/hospital.png', _launchHospital),
                    _contanier('질의응답', 'contents', 'image/doctor.png', _launchQA),
                    _contanier('의사정보', 'contents', 'image/stethoscope.png', _launchDoctor),
                  ],
                ),
              ),
              //이달의 픽
              Container(
                padding: const EdgeInsets.only(left: 16, top: 25),
                child: const Text(
                  '추천정보',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    Positioned(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: const ListTile(
                            leading: Icon(
                              Icons.health_and_safety_rounded,
                              color: Colors.green,
                              size: 40,
                            ),
                            title: Text(
                              '건강정보',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            trailing: IconButton(
                                icon: Icon(Icons.arrow_forward_ios_rounded),
                                onPressed: _launchHealthInfo), // 건강정보 페이지로 이동
                          ),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 2.0, color: Colors.black12
                              )
                            )
                          ),
                        ),
                        const SizedBox(height: 15),
                       const ListTile(
                          leading: Icon(
                            Icons.run_circle_rounded,
                            color: Colors.blueAccent,
                            size: 40,
                          ),
                          title: Text(
                            '추천운동',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                            onPressed: _launchRecommendEx,
                          ), // 건강정보 페이지로 이동
                        ),
                        const SizedBox(height: 15),
                        Container(
                          child: const ListTile(
                            leading: Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.redAccent,
                              size: 40,
                            ),
                            title: Text(
                              '환경정보',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              onPressed: _launchEnvironmentInfo,
                            ), // 건강정보 페이지로 이동
                          ),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2.0, color: Colors.black12
                                  )
                              )
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              // 추천활동
              //이달의 픽
              Container(
                padding: const EdgeInsets.only(left: 16, top: 25),
                child: const Text(
                  '추천장소',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 3.5/7,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[ // 위에 생성한 _recommendPlace 위젯을 사용해줌
                    _recommendPlace('맛집', 'image/dining.jpg', 'image/dining.jpg', _launchRestaurant ),
                    _recommendPlace('우리시장', 'image/marketplace.jpg', 'image/marketplace.jpg', _launchMarket),
                    _recommendPlace('문화시설', 'image/culture.jpg', 'image/culture.jpg', _launchCulture),
                    _recommendPlace('공원', 'image/park.jpg', 'image/park.jpg', _launchPark),
                  ],
                ),
                ),
              const SizedBox(height: 10),
              Column(
                children: [
                  _text('지금 찾는 키워드'),
                  const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              _text('인기 명소 top5'),
              const SizedBox(height: 10),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/share.jpg'), fit: BoxFit.fill),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _text('나눔 정보'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_box_rounded,
                          ))
                      // icon 컬러, size, navigator
                    ],
                  ),
                  const SizedBox(height: 10),
                  _subTitle('1. [무료][서울 강남구] 신형 진단 키트 나눔'),
                  _subTitle('2. [직거래][서울 노원구] 2020년 진단 키드 쿨거래'),
                  _subTitle('3. [무료][서울 강서구] 의료 3.0 세미나 입장권'),
                  _subTitle('4. [직거래][서울 중구] 2022년 스마트 헬스 행사 입장권'),
                  _subTitle('5. [직거래][경기 분당] 뇌졸중에 좋은 고랭지 배추 분양'),
                ],
              ),
            ],
          ),
        ));
  }
}
// url
// 건강정보
_launchHealthInfo() async {
  const _healthInfo = 'url';
  if (await canLaunch(_healthInfo)) {
    await launch(_healthInfo);
  } else {
    throw 'Could not Launch $_healthInfo';
  }
}
// 추천운동
_launchRecommendEx() async {
  const _recommendEx = 'url';
  if (await canLaunch(_recommendEx)) {
    await launch(_recommendEx);
  } else {
    throw 'Could not Launch $_recommendEx';
  }
}
// 환경정보
_launchEnvironmentInfo() async {
  const _environmentInfo = 'https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=%EC%A0%84%EA%B5%AD%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80';
  if (await canLaunch(_environmentInfo)) {
    await launch(_environmentInfo);
  } else {
    throw 'Could not Launch $_environmentInfo';
  }
}

//recommendPlace url
// 맛집 url
_launchRestaurant() async{
  const _restaurantUrl = 'https://map.naver.com/v5/search/%EB%A7%9B%EC%A7%91?c=14139780.2915596,4510320.8142796,15,0,0,0,dh';
  if (await canLaunch(_restaurantUrl)) {
    await launch(_restaurantUrl);
  } else {
    throw 'Could not Launch $_restaurantUrl';
  }
}
// 우리시장 url
_launchMarket() async{
  const _marketUrl = 'https://map.naver.com/v5/search/%EC%8B%9C%EC%9E%A5?c=14139780.2915596,4510320.8142796,15,0,0,0,dh';
  if (await canLaunch(_marketUrl)) {
    await launch(_marketUrl);
  } else {
    throw 'Could not Launch $_marketUrl';
  }
}
// 문화시설 url
_launchCulture() async{
  const _cultureUrl =   'https://map.naver.com/v5/search/%EB%AC%B8%ED%99%94%EC%8B%9C%EC%84%A4?c=14136802.1946183,4513331.8124654,13,0,0,0,dh';
  if (await canLaunch(_cultureUrl)) {
    await launch(_cultureUrl);
  } else {
    throw 'Could not Launch $_cultureUrl';
  }
}
// 공원 url
_launchPark() async{
  const _parkUrl = 'https://map.naver.com/v5/search/%EA%B3%B5%EC%9B%90?c=14139806.0954176,4512188.3281197,15,0,0,0,dh';
  if (await canLaunch(_parkUrl)) {
    await launch(_parkUrl);
  } else {
    throw 'Could not Launch $_parkUrl';
  }
}




