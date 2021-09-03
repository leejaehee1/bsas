import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../db/database.dart';
import 'hospital_add_screen.dart';
import 'package:bsas/db/database.dart';

import 'hospital_data_detail.dart';

class HosHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HosHomeScreenState();
  }
}

class HosHomeScreenState extends State {
  var dbHelper = DatabaseHelper();
  late List data;
  int DataCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    getHospitalData();
    //super.initState();
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
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF43aa8b),
        onPressed: () {
          goToHosDataAdd();
        },
        child: Icon(Icons.add),
        tooltip: "병원 등록",
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
        itemCount: DataCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF43aa8b),
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                this.data[position].name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              subtitle: Text(
                this.data[position].publicPhone,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black54),
              ),
              onTap: () {
                goToHosDetail(this.data[position]);
              },
            ),
          );
        });
  }

  void goToHosDataAdd() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddHospital()));
    if (result != null) {
      if (result) {
        getHospitalData();
      }
    }
  }

  void getHospitalData() async {
    var hospitalDataFuture = dbHelper.getHospitalData();
    hospitalDataFuture.then((data) {
      setState(() {
        this.data = data;
        DataCount = data.length;
      });
    });
  }

  void goToHosDetail(data) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => HosDataDetail(data)));
    if (result != null) {
      if (result) {
        getHospitalData();
      }
    }
  }
}

