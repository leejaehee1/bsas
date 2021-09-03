import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navigate_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF43aa8b),
                  Color(0xFFDCEDC8),
                ],
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: Image.asset(
                    "image/icon_seven.png",
                    width: 200,
                    height: 200,
                  )),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      'Login', //글자 색상 및 폰트 수정
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _textInformation(hint: 'id', icon: Icons.person),
                _textInformation(hint: 'password', icon: Icons.vpn_key_rounded),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomCenter,
                  child: Text('id/password 찾기'),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder) => NavigatorPage()));
            },
            child: Container(
              width: 360,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF43aa8b),
                    Color(0xFFDCEDC8),
                  ]
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: [
            //       Color(0xFF43aa8b),
            //       Color(0xFFDCEDC8),
            //     ]
            //   ),
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            // child: ElevatedButton(
            //   child: Text("sign in",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w700,
            //     fontSize: 30,
            //   ),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     primary: Color(0xFF43aa8b),
            //   ),
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => NavigatorPage()));
            //   },
            // ),
          ),
        ],
      ),
    );
  }

  Widget _textInformation({Controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: Controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
