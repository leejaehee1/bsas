import 'package:flutter/material.dart';
import 'User/user_home_screen.dart';
import 'navigate_page.dart';


void main() async {
  runApp(MyApp());
}

MaterialColor MyGreen = const MaterialColor(0xFF43aa8b, {
  50: Color(0xFF64DD17),
  100: Color(0xFFAA00FF),
  200: Color(0xFF00C853), //메인으로 했던 컬러
  300: Color(0xFF00695C), //
  400: Color(0xFF009688), ////
  500: Color(0xFF43aa8b), //// good
  600: Color(0xFFD500F9),
  700: Color(0xFF00BFA5), //메인컬러
  800: Color(0xFF7C4DFF),
  900: Color(0xFF7E57C2),
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => NavigatorPage(),
        '/page1': (context) => HomeScreen(), //지인등록페이지
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomeScreen(),
    );
  }
}