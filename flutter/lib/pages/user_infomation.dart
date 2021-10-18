import 'package:bsas/user_info_page/activity_page.dart';
import 'package:bsas/user_info_page/edit_profile/edit_profile.dart';
import 'package:bsas/user_info_page/notice_page.dart';
import 'package:bsas/user_info_page/question_page.dart';
import 'package:bsas/user_info_page/setting_page.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 220,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      title: _text(
                          '000님 안녕하세요'), //회원가입, 로그인 완성되면 '000님' 부분에 data get 해오기
                      subtitle:
                          _subText('이메일'), //회원가입, 로그인 완성되면 email data get 해오기
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xFFE0E0E0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => EditProfileDetail(
                                  )));
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _columnBuild('쿠폰', Icons.payments_outlined),
                      _columnBuild('이벤트', Icons.event_available_outlined),
                      _columnBuild('포인트', Icons.control_point_duplicate_outlined),
                      _columnBuild('친구초대', Icons.person_add_alt_1_outlined),
                    ],
                  )
                ],
              ),
            ),
          ),
          // 고객센터 카테고리
          SingleChildScrollView(
            child: Card(
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 활동 내역
                    ListTile(
                        leading: _thirdText('고객센터')
                    ),
                    _gestureDetector('자주묻는질문', Icons.assignment_outlined, ActivityPage()), //활동내역
                    _gestureDetector('문의사항', Icons.question_answer_outlined, const QuestionPage()), //문의사항
                    _gestureDetector('공지사항', Icons.keyboard_voice_outlined, NoticePage()), // 공지사항
                  ],
                ),
              ),
            ),
          ),
          // 설정 카테고리
          SingleChildScrollView(
            child: Card(
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                        leading: _thirdText('설정')
                    ),
                    _gestureDetector('앱설정', Icons.settings, SettingPage()),
                    _gestureDetector('알람설정', Icons.alarm_add_rounded, SettingPage()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  // 위젯 모음
  Widget _text(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _subText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFE0E0E0),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _thirdText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _columnBuild(String text, dynamic icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {}, // 추후 navigate 추가해야함 (dynamic으로 추가하기)
            icon: Icon(
              icon,
              size: 30,
              color: Colors.black,
            )),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
  Widget _gestureDetector(String text, dynamic icon, dynamic navigate) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => navigate));
      },
      child: ListTile(
        leading: Icon(icon, color: Colors.black,),
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
