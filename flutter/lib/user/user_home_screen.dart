import 'package:final_js/user/user_add_screen.dart';
import 'package:final_js/user/user_data_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../db/database.dart';
import 'package:final_js/model/data_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State {
  var dbHelper = DatabaseHelper();
  late List data;
  int DataCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    this.getUserData();
    super.initState();
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
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF43aa8b),
        onPressed: () {
          goToDataAdd();
        },
        child: Icon(Icons.add),
        tooltip: "지인 등록",
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
                child:
                // Text("O"),
                Icon(Icons.person, color: Colors.white),
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
                    color: Colors.black45),
              ),
              onTap: () {
                goToDetail(this.data[position]);
              },
            ),
          );
        });
  }

  void goToDataAdd() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddUser()));
    if (result != null) {
      if (result) {
        getUserData();
      }
    }
  }

  void getUserData() async {
    var productsFuture = dbHelper.getUserData();
    productsFuture.then((data) {
      setState(() {
        this.data = data;
        DataCount = data.length;
      });
    });
  }

  void goToDetail(data) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => DataDetail(data)));
    if (result != null) {
      if (result) {
        getUserData();
      }
    }
  }
}