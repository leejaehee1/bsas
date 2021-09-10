import 'package:bsas/pages/emergency_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'pages/star_page.dart';
import 'pages/person_page.dart';
import 'pages/talk_first.dart';
import 'pages/search.dart';
import 'pages/user_infomation.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 5, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BSAS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              // color: Color(0xFF43aa8b),
            ),
            onPressed: () {}, // -> 추후에 페이지와 항목 적용할 수 있음
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder) => EmergencyPage()));
              },
              child: Container(
                // height: 60,
                width: 80,
                margin:EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "긴급호출",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              child: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => LoginPage()));
              },
            ),
          ],
          // centerTitle: true,
          titleSpacing: 20,
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: controller,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.people_rounded,
                ),
              ),
              // icon color -> white or color: Color(0xFF43aa8b)
              Tab(
                icon: Icon(
                  Icons.chat_rounded,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.star_rounded,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search_rounded,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person_pin_rounded,
                ),
              )
            ],
          ),
          backgroundColor: const Color(0xFF43aa8b), // or white
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            PersonPage(), //TAB1
            TalkPageFirst(), //TAB2
            StarPage(), //TAB3
            TalkPageSecond(), //TAB4
            UserInformation(), //TAB5
          ],
        ),
      ));
}
