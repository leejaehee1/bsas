import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:plms_start/pages/photoList.dart';
import 'package:plms_start/pages/home.dart';
import 'package:plms_start/pages/sign_up_page.dart';
// import 'screens/controller/dropdown_button_controller.dart';
// import 'screens/controller/dropdown_button_controller2.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller3.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller4.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller5.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller6.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller7.dart';
import 'package:plms_start/screens/loading.dart';

import 'pages/punch_complete.dart';
import 'pages/confirm_page.dart';
import 'pages/login_pages.dart';
import 'pages/punch_screen.dart';
import 'pages/success_page.dart';

import 'screens/utils/draft_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    test();
    super.initState();
  }

  List<String> category = [];
  List<String> system = [];
  List<String> subsystem = [];
  List<String> discipline = [];

  Future<dynamic> test() async {
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    print(json.runtimeType);
    print(json[0]['category']);
    int len = json.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len; i++) {
          category += [json[i]['category']];
        }
      });
///////////////////////////////
    var uriResponse2 = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/system/',
      ),
    );

    var json2 = jsonDecode(uriResponse2.body);
    print(json2[0]['system']);
    int len2 = json2.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len2; i++) {
          system += [json2[i]['system']];
        }
      });
/////////////////////////////
    var uriResponse3 = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/subsystem/',
      ),
    );

    var json3 = jsonDecode(uriResponse3.body);
    print(json3[0]['subsystem']);
    int len3 = json3.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len3; i++) {
          subsystem += [json3[i]['subsystem']];
        }
      });
////////////////////////
    var uriResponse4 = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/discipline/',
      ),
    );

    var json4 = jsonDecode(uriResponse4.body);
    print(json4[0]['discipline']);
    int len4 = json4.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len4; i++) {
          discipline += [json4[i]['discipline']];
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nanum',
      ),
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      // home: Home(),
      initialRoute: '/',
      initialBinding: BindingsBuilder(() {
        //   Get.put(DropdownButtonController());
        //   Get.put(DropdownButtonController2());
        //   Get.put(DropdownButtonController3());
        //   Get.put(DropdownButtonController4());
        //   Get.put(DropdownButtonController5());
        //   Get.put(DropdownButtonController6());
        //   Get.put(DropdownButtonController7());
      }),

      getPages: [
        GetPage(
            name: '/', page: () => LoginPage(), transition: Transition.zoom),
        GetPage(name: '/home', page: () => Home(), transition: Transition.zoom),
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
          transition: Transition.zoom,
        ),
        GetPage(
            name: '/loading',
            page: () => Loading(),
            transition: Transition.zoom),
        GetPage(
          name: '/punchList',
          page: () => PunchScreen(),
          transition: Transition.zoom,
        ),
        GetPage(
            name: '/draft',
            page: () => DraftPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/confirm',
            page: () => ConfirmPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/success',
            page: () => SuccessPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/photoList',
            page: () => PhotoList(),
            transition: Transition.zoom),
        GetPage(
            name: '/complete',
            page: () => PunchComplete(),
            transition: Transition.zoom),
      ],
    );
  }
}
