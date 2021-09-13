import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'create_account_page.dart';
import 'navigate_page.dart';
import '/model/member_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final MemberViewModel viewModel = MemberViewModel();

  String _id = "";
  String _pw = "";

  final _idController = TextEditingController();
  final _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TextEditingController _idController = new TextEditingController();
    // TextEditingController _pwController = new TextEditingController();

    @override
    void dispose() {
      super.initState();
      _idController.dispose();
      _pwController.dispose(); //입력 끊어주는 역할
      super.dispose();
    }

    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("로그인 실패"),
            content: new Text("아이디와 패스워드를 확인하세요."),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

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
                      'Login',
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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'id',
                        prefixIcon: Icon(Icons.person),),
                    onSaved: (input) => _id = input!,

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _pwController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'password',
                        prefixIcon: Icon(Icons.vpn_key_rounded),
                        ),
                    onSaved: (input) => _pw = input!,

                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.bottomCenter,
                    child: Text('id/password 찾기'),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> NavigatorPage()));
                  },
                ),
                Container(
                  // margin: EdgeInsets.only(top: 0.1),
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CreateAccountPage()));
                    },
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () async {

              var fetchLogin = await viewModel.fetchLogin(
                  _idController.value.text, _pwController.value.text);

              if (fetchLogin == true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => NavigatorPage()));
              } else {
                _showDialog();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF43aa8b),
                      Color(0xFFDCEDC8),
                    ]),
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
          ),
        ],
      ),
    );
  }
}
