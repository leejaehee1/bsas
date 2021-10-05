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
  @override
  _StarPageState createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late CameraPosition _googleMapCamera;
  Marker? marker;
  LocationData? currentLocation;

  // currentLocation.latitude = 37.66809443;
  // currentLocation.longitude = 126.74454984;

  void _currentLocation() async {
    var location = new Location();
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
    final response =
    await client.get(Uri.parse("http://54.180.102.153:18080/api/monthlyPick"));
    return parsePhotos(response.body);
  }

  // recommend activity 호출
  Future<List<RecommendActivity>> recommendActivity(http.Client client) async {
    final response =
    await client.get(Uri.parse("http://54.180.102.153:18080/api/recommendActivity"));
    return recommendAct(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.monthlyPick(http.Client());
    this.recommendActivity(http.Client());
  }

  Widget _contanier(String text, String url) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.fill)),
    );
  }

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
    _currentLocation();
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //google map
              Container(
                padding: EdgeInsets.only(left: 16, top: 25),
                child: Text(
                  '스마트 맵',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 3.5 / 7,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        currentLocation!.latitude!,
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
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 3.5 / 7,
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
                  '추천활동',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    child: FutureBuilder<List<RecommendActivity>>(
                      future: recommendActivity(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);

                        return snapshot.hasData
                            ? _buildRecommendActivity(
                          list: snapshot.data!,
                        )
                            : Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // 추천활동
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
              SizedBox(height: 10),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    child: FutureBuilder<List<MonthlyPick>>(
                      future: monthlyPick(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);

                        return snapshot.hasData
                            ? _buildMonthlyPick(
                          list: snapshot.data!,
                        )
                            : Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ),
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
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.add_box_rounded,))
                      // icon 컬러, size, navigator
                    ],
                  ),
                  SizedBox(height: 10),
                  _subTitle('1. [무료][서울 강남구] 신형 진단 키트 나눔'),
                  _subTitle('2. [직거래][서울 노원구] 2020년 진단 키드 쿨거래'),
                  _subTitle('3. [무료][서울 강서구] 의료 3.0 세미나 입장권'),
                  _subTitle('4. [직거래][서울 중구] 2022년 스마트 헬스 행사 입장권'),
                  _subTitle('5. [직거래][경기 분당] 뇌졸중에 좋은 고랭지 배추 분양'),
                ],
              ),
            ],
          ),
        )
    );
  }
}

//monthly pick
class _buildMonthlyPick extends StatelessWidget {
  final List<MonthlyPick> list;
  _buildMonthlyPick({required this.list});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index){
          return Container( // card를 container로 감싸고
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Stack(
                children: [
                  Positioned(
                      child: Column(
                        children: [
                          Center(child: InkWell(onTap: () => _launchMonthlyPick(index),
                              child: Image.network(list[index].img_url, height: 200, width:320, fit: BoxFit.cover))),
                          SizedBox(height: 2),
                          Text(list[index].title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),),
                          SizedBox(height: 2),
                          Text(list[index].contents, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),)
                        ],
                      )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

List<String> _urlMonthlyPic = [
  'http://54.180.102.153:18080/api/monthlyPick/4',
  'http://54.180.102.153:18080/api/monthlyPick/5',
  'http://54.180.102.153:18080/api/monthlyPick/6',
];

 _launchMonthlyPick(index) async{
  if (await canLaunch(_urlMonthlyPic[index])) {
    await launch(_urlMonthlyPic[index]);
  } else {
    throw 'Could not Launch $_urlMonthlyPic';
  }
}
}


//recommend activity
class _buildRecommendActivity extends StatelessWidget {
  final List<RecommendActivity> list;

  _buildRecommendActivity({required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  onTap: (){
                    _launchRecommendActivity(index);
                  },
                  leading: Image.network(list[index].img_url),
                  title: Text(list[index].title),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> _urlRecommendActivity = [
    // 'http://54.180.102.153:18080/api/recommendActivity/${id}',
    'http://54.180.102.153:18080/api/recommendActivity/4',
    'http://54.180.102.153:18080/api/recommendActivity/5',
    'http://54.180.102.153:18080/api/recommendActivity/6',
  ];
  // Future<dynamic> _urlRecommendActivity(String id) async {
  //   var url = 'http://54.180.102.153:18080/api/recommendActivity/' + id;
  //   if (await canLaunch(url)) {
  //     await launch(url, forceWebView: true);
  //   } else {
  //     throw 'Could not Launch %url';
  //   }
  // }

  _launchRecommendActivity(index) async{
    if (await canLaunch(_urlRecommendActivity[index])) {
      await launch(_urlRecommendActivity[index]);
    } else {
      throw 'Could not Launch $_urlRecommendActivity';
    }
  }
}