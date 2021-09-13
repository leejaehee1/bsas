import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'db/database.dart';
import 'login_page.dart';
import 'model/acount.dart';


class CreateAccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateAccountPageState();
  }
}


class CreateAccountPageState extends State {
  String _name = '';
  String _password = '';

  var txtName = TextEditingController();
  var txtPassword = TextEditingController();
  var dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF43aa8b),
              Color(0xFFDCEDC8),
            ], // 그라데이션 색상 수정
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => LoginPage())),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  '회원가입',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  // key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            labelText: 'id',
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF43aa8b),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          validator: (input) => //유효성 검사
                          input!.trim().isEmpty ? 'id를 입력하세요' : null,
                          onSaved: (input) => _name = input!,
                          // initialValue: _name,
                          controller: txtName,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                              labelText: '비밀번호',
                              labelStyle: TextStyle(fontSize: 18.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF43aa8b),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                          validator: (input) =>
                          input!.trim().isEmpty ? '비밀번호를 입력하세요' : null,
                          onSaved: (input) => _password = input!,
                          // initialValue: _publicPhone,
                          controller: txtPassword,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 60.0,
                        width: double.infinity,
                        child: RaisedButton(
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          color: Color(0xFF43aa8b),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: (){
                            addAccountData();
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addAccountData() async{
    var result = await dbHelper.insertAccountData(accountData(
        name: txtName.text,
        password: txtPassword.text,
    ));
    Navigator.pop(context,true);
  }
}
