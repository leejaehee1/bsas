import 'package:bsas/user/user_add_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State {
  late List list;
  // UserDataBaseHelper userDataBaseHelper = UserDataBaseHelper();

  Future<List> getData() async {
    var response = await http.get(Uri.parse("http://localhost:18080/api/users"));
    return json.decode(response.body);
  }

  // Future<List> getUserData() async {
  //   final response = await http.get(Uri.parse("http://localhost:18080/api/users")); //localhost 기본값 설정 해제 후 재실행 -> 완료
  //   print('Response status: ${response.statusCode}');
  //   if (response.statusCode == 200) {
  //     List data = jsonDecode(response.body);
  //     var userList = data.map((element) => User.fromJson(element)).toList();
  //     return userList;
  //   } else {
  //     throw Exception('Failed');
  //   }
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text(
          "지인 등록",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? UserList(
              list: snapshot.data!,
            )
                : Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF43aa8b),
        onPressed: () {
          // goToDataAdd();
          Navigator.push(context, MaterialPageRoute(builder: (_)=>AddUser()));
        },
        child: Icon(Icons.add),
        tooltip: "지인 등록",
      ),
    );
  }
}


class UserList extends StatelessWidget {
  final List list;
  UserList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              // child: GestureDetector(
              //   onTap: () => Navigator.push(context,
              // MaterialPageRoute(builder: (context) => DataDetail()))
              //   ),
                child: Container(
                  //color: Colors.black,
                  height: 100.3,
                  child: new Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // add this
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list[i]['name'].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list[i]['phone'].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black87),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}


