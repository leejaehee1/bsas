import 'package:bsas/center/center_data_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'center_add_screen.dart';

class CenterHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CenterHomeScreenState();
  }
}

class CenterHomeScreenState extends State {
  late List list;

  Future<List> getCenterData() async {
    var response = await http.get(Uri.parse("http://54.180.102.153:18080/api/centers"));
    return json.decode(response.body);
  }

  _navigateCenter(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCenter()));
    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getCenterData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text(
          "센터 등록",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder<List>(
            future: getCenterData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? CenterList(
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
        onPressed: () => _navigateCenter(context),
        child: Icon(Icons.add),
        tooltip: "센터 등록",
      ),
    );
  }
}


class CenterList extends StatelessWidget {
  final List list;
  CenterList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          child: GestureDetector(
            onTap: () => Navigator.push(context, 
                MaterialPageRoute(builder: (context) => CenterDetail(
                    index: i, 
                    list: list))),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
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
            ),
          ),
        );
      },
    );
  }
}


