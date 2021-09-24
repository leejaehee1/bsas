import 'package:bsas/user/user_add_screen.dart';
import 'package:bsas/user/user_delete.dart';
import 'package:bsas/user/user_detail_page.dart';
import 'package:bsas/user/user_edit_page.dart';
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

  Future<List> getData() async {
    var response = await http.get(Uri.parse("http://3.36.200.118:18080/api/users"));
    //http://3.36.200.118:18080/api/users
    return json.decode(response.body);
  }

  _navigateAddUser(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddUser()),
    );
    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
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
        // onPressed: () {
        //   _navigateAddUser();
        //   // goToDataAdd();
        //   // Navigator.push(context, MaterialPageRoute(builder: (_)=>AddUser()));
        // },
        onPressed: () => _navigateAddUser(context),
        child: Icon(Icons.add),
        tooltip: "등록",
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
              child: GestureDetector(
                onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditUser(
                list: list,
                index: i,
              ))
                ),
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
            ),
          ],
        );
      },
    );
  }
}


