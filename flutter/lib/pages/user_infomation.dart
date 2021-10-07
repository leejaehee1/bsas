import 'package:bsas/user_info_page/activity_page.dart';
import 'package:bsas/user_info_page/addFriends_page.dart';
import 'package:bsas/user_info_page/notice_page.dart';
import 'package:bsas/user_info_page/question_page.dart';
import 'package:bsas/user_info_page/setting_page.dart';
import 'package:bsas/user_info_page/user_info_edit.dart';
import 'package:flutter/material.dart';


class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {

  Widget _text(String text){
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //사용자 이미지 및 이름
                    Row(
                      children: [
                        CircleAvatar(
                         backgroundColor: Color(0xFF43aa8b),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "박마크",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                    // 알람 버튼
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.notifications_outlined,
                        size: 30,
                        color: Colors.black54,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3),
              // 사용자 프로필 편집 화면
              Container(
                height: 90,
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width *1.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.black54)
                    ),
                    elevation: 0.0,
                    color: Colors.white,
                    // // shape: ShapeBorder,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => UserInfoEdit()));
                    }, // 프로필 편집 페이지로 연결
                    child: Text(
                      '프로필 편집',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  )
                ),
              ),
              SizedBox(height: 20),
              // 세부 카테고리
              Container(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // 활동 내역
                        GestureDetector(
                          onTap : (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> ActivityPage()));
                          },
                        child: ListTile(
                          leading: Icon(Icons.assignment_outlined),
                          title: _text('활동내역'),
                        ),
                      ),
                        // 문의사항
                        GestureDetector(
                          onTap : (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> QuestionPage()));
                          },
                          child: ListTile(
                            leading: Icon(Icons.question_answer_outlined),
                            title: _text('고객센터'),
                          ),
                        ),
                        // 공지사항
                        GestureDetector(
                          onTap : (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> NoticePage()));
                          },
                          child: ListTile(
                            leading: Icon(Icons.keyboard_voice_outlined),
                            title: _text('공지사항'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // 세부 카테고리
              Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap : (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> AddFriendsPage()));
                          },
                          child: ListTile(
                            leading: Icon(Icons.person_add_alt_1_rounded),
                            title: _text('친구초대'),
                          ),
                        ),
                        GestureDetector(
                          onTap : (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> SettingPage()));
                          },
                          child: ListTile(
                            leading: Icon(Icons.settings),
                            title: _text('앱 설정'),
                          ),
                        ),
                      ],
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