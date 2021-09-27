import 'package:bsas/db/hospital_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'hospital_home_screen.dart';


class AddHospital extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddHospitalState();
  }
}

class AddHospitalState extends State {

  String _name = '';
  String _phone = '';
  String _publicPhone = '';
  String _email = '';

  HospitalDBHelper hospitalDataBaseHelper = HospitalDBHelper();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _publicPhoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // or white or 0xFF00C853
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HosHomeScreen())),
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
                  '병원 등록',
                  style: TextStyle(
                    color: Color(0xFF43aa8b),
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
                            labelText: '이름',
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
                          input!.trim().isEmpty ? '이름을 입력하세요' : null,
                          onSaved: (input) => _name = input!,
                          // initialValue: _name,
                          controller: _nameController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                              labelText: '전화번호',
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
                          input!.trim().isEmpty ? '전화번호를 입력하세요' : null,
                          onSaved: (input) => _phone = input!,
                          // initialValue: _publicPhone,
                          controller: _phoneController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                              labelText: '담당자 연락처',
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
                          input!.trim().isEmpty ? '담당자 연락처를 입력하세요' : null,
                          onSaved: (input) => _publicPhone = input!,
                          // initialValue: _publicPhone,
                          controller: _publicPhoneController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                              labelText: '이메일',
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
                          input!.trim().isEmpty ? '이메일을 입력하세요' : null,
                          onSaved: (input) => _email = input!,
                          // initialValue: _mail,
                          controller: _emailController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 60.0,
                        width: double.infinity,
                        // decoration: BoxDecoration(
                        //   color: Color(0xFF00C853),
                        //   borderRadius: BorderRadius.circular(80.0),
                        // ),
                        child: RaisedButton(
                          child: Text(
                            '저장',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          color: Color(0xFF43aa8b),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: () {
                            hospitalDataBaseHelper.addHospital(
                              _nameController.text,
                              _phoneController.text,
                              _publicPhoneController.text,
                              _emailController.text,
                            );
                            Navigator.pop(context, true);
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
}


