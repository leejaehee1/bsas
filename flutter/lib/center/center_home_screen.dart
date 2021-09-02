import 'package:final_js/db/database.dart';
import 'package:final_js/user/user_data_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../navigate_page.dart';
import '../db/database.dart';
import '../model/data_model.dart';
import 'center_add_screen.dart';
import 'center_data_detail.dart';

class CenHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CenHomeScreenState();
  }
}

class CenHomeScreenState extends State {
  var dbHelper = DatabaseHelper();
  late List data;
  int DataCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    getCenterData();
    //super.initState();
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
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF43aa8b),
        onPressed: () {
          goToDataAdd();
        },
        child: Icon(Icons.add),
        tooltip: "센터 등록",
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
                goToCenterDetail(this.data[position]);
              },
            ),
          );
        });
  }

  void goToDataAdd() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddCenter()));
    if (result != null) {
      if (result) {
        getCenterData();
      }
    }
  }

  void getCenterData() async {
    var productsFuture = dbHelper.getCenterData();
    productsFuture.then((centerData) {
      setState(() {
        this.data = centerData;
        DataCount = centerData.length;
      });
    });
  }

  void goToCenterDetail(centerData) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CenDataDetail(centerData)));
    if (result != null) {
      if (result) {
        getCenterData();
      }
    }
  }
}

