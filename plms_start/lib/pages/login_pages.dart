import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idTextEditController = TextEditingController();
  final _pwTextEditController = TextEditingController();

  late double headerTopZone;

  @override
  void dispose() {
    _idTextEditController.dispose();
    _pwTextEditController.dispose();
    super.dispose();
  }

  Widget _background() {
    return SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/images/login_page3.png",
            ),
          ),
        ),
      ),
    );
  }

  Widget _textform() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Get.height * 1 / 30,
            width: Get.width * 4.5 / 7,
            child: TextFormField(
              controller: _idTextEditController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.loginID,
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: Get.height * 1 / 30,
          ),
          Container(
            height: Get.height * 1 / 30,
            width: Get.width * 4.5 / 7,
            child: TextFormField(
              controller: _pwTextEditController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.loginPW,
                // labelText: AppLocalizations.of(context)!.loginPW,
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _button() {
    return Container(
      width: Get.width * 3 / 7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff304D5B),
        ),
        onPressed: () async {
          var url = Uri.parse('http://10.0.2.2:5000/api/login');
          var response = await http.post(url, body: {
            'userID': _idTextEditController.text,
            'password': _pwTextEditController.text,
          });
          if (response.body == "true") {
            Get.toNamed('/home');
          } else {
            _showDialog();
          }
        },
        child: Text(
          AppLocalizations.of(context)!.signIn,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _signuptext() {
    return Column(
      children: [
        Container(
          // width: 1,
          height: 3,
          child: Icon(
            Icons.arrow_drop_down,
            size: 50,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.signUpText,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _textbutton() {
    return TextButton(
        onPressed: () {
          Get.toNamed("/signup");
        },
        child: Text(
          AppLocalizations.of(context)!.signUp,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ));
  }

  @override
  Widget build(BuildContext context) {
    headerTopZone = Get.mediaQuery.padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _background(),
          Positioned(
            left: 0,
            right: 0,
            top: Get.height * 4.5 / 8,
            bottom: 10,
            child: Column(
              children: [
                _textform(),
                SizedBox(
                  height: 30,
                ),
                _button(),
                SizedBox(
                  height: 30,
                ),
                _signuptext(),
                SizedBox(
                  height: 5,
                ),
                _textbutton(),
              ],
            ),
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   top: 380,
          //   bottom: 10,
          //   child: _textform(),
          // ),
          // Positioned(
          //   left: 170,
          //   right: 170,
          //   top: 450,
          //   bottom: 200,
          //   child: _button(),
          // ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   top: 500,
          //   bottom: 100,
          //   child: _signuptext(),
          // ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   top: 500,
          //   bottom: 100,
          //   child: _textbutton(),
          // ),
        ],
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text(AppLocalizations.of(context)!.loginDialogText),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff71838D),
                  ),
                  child:
                      new Text(AppLocalizations.of(context)!.loginDialogButton),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
