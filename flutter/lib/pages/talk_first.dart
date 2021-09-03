import 'package:bsas/center/center_home_screen.dart';
import 'package:bsas/hospital/hospital_home_screen.dart';
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
                    height: 64,
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   borderRadius: BorderRadius.circular(12),
                    //   border: Border.all(color: Colors.black12, width: 1),
                    // ),
                    child: RaisedButton(
                      color: Color(0xFF43aa8b),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => CenHomeScreen()));
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.people_alt, color: Colors.white),
                          Padding(padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('지인등록', style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12, width: 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.people_alt_rounded, color: Color(0xFF43aa8b),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
                          },),
                        Padding(padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('지인등록', style: TextStyle(
                                color: Color(0xFF43aa8b),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12, width: 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.pending_actions_rounded, color: Color(0xFF43aa8b)), //센터등록 아이콘 및 사진으로 변경하기
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> CenHomeScreen()));
                          }, //센터등록 페이지로 이동하기
                        ),
                        Padding(padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('센터등록', style: TextStyle(
                                color: Color(0xFF43aa8b),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12, width: 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => HosHomeScreen()));
                        }, // 병원등록 홈페이지로 이동
                            icon: Icon(Icons.local_hospital_rounded, color: Color(0xFF43aa8b),)),
                        Padding(padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('병원등록', style: TextStyle(
                                color: Color(0xFF43aa8b),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ],


    // child: ElevatedButton(
    //   onPressed: () {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (_) =>HomeScreen()));
    //   },
    //   child: Text("지인등록"),
    // )


  );
}