import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

import 'package:plms_start/pages/utils/button_issue.dart';
// import 'package:plms_start/pages/utils/header_issue.dart';

// import 'screen_punch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'List_file.dart';
import 'list_Close.dart';
import 'list_Draft.dart';
import 'list_Open.dart';
import 'list_Req.dart';

class ScreenList extends StatefulWidget {
  const ScreenList({Key? key}) : super(key: key);

  @override
  _ScreenListState createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList>
    with SingleTickerProviderStateMixin {
  // late TabController _controller;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int idx = _currentIndex;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2B3745),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.appTitle),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/');
                },
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff5C8893),
                ),
              ),
            ],
          ),
        ),
        body: DefaultTabController(
          // initialIndex: 0,
          length: 5,
          child: Column(
            children: [
              Container(
                color: Color(0xFFE6E6E6),
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  child: TabBar(
                    labelPadding: EdgeInsets.symmetric(horizontal: 1),
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 1,
                    // isScrollable: true,
                    labelColor:
                        _currentIndex == idx ? Colors.white : Colors.black,
                    tabs: [
                      _tabBars(
                          0xff9E9E9E, AppLocalizations.of(context)!.tile1, 0),
                      _tabBars(
                          0xff7B3F40, AppLocalizations.of(context)!.tile2, 1),
                      _tabBars(
                          0xffB09078, AppLocalizations.of(context)!.tile3, 2),
                      _tabBars(
                          0xff95809D, AppLocalizations.of(context)!.tile4, 3),
                      _tabBars(
                          0xff637990, AppLocalizations.of(context)!.tile5, 4),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListFile(),
                    ListDraft(),
                    ListOpen(),
                    ListReq(),
                    ListClose(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: IssueButton(
            name: '/loading',
            name2: '/photoList',
            buttonname1: AppLocalizations.of(context)!.pListbutton1,
            buttonname2: AppLocalizations.of(context)!.pListbutton2));
  }

  Widget _tabBars(int colors, String tiles, int idx) {
    return Container(
      padding: EdgeInsets.all(2),
      width: MediaQuery.of(context).size.width * 1 / 5,
      color: _currentIndex == idx ? Color(colors) : Colors.white,
      child: Tab(child: _colorChange(tiles, idx)),
    );
  }

  Widget _colorChange(String name, int idx) {
    return Text(
      name,
      style: TextStyle(
          color: _currentIndex == idx ? Colors.white : Colors.black,
          fontSize: 12),
    );
  }
}
