import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'hospital_add_screen.dart';
import 'hospital_detail.dart';

class HosHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HosHomeScreenState();
  }
}

class HosHomeScreenState extends State {
  late List list;

  Future<List> getHosData() async {
    var response = await http.get(Uri.parse("http://54.180.102.153:18080/api/hospitals"));
    return json.decode(response.body);
  }
  _navigateHospital(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddHospital()),
    );
    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getHosData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text(
          "병원 등록",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder<List>(
            future: getHosData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? HospitalList(
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
        onPressed: () =>
          _navigateHospital(context),
        child: Icon(Icons.add),
        tooltip: "병원 등록",
      ),
    );
  }
}


class HospitalList extends StatelessWidget {
  final List list;
  HospitalList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HospitalDetail(
                  list: list,
                  index: i,
                ))
            ),
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


