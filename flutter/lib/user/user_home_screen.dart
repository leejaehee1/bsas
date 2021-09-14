import 'package:bsas/db/user_db.dart';
import 'package:bsas/model/user_model.dart';
import 'package:bsas/user/user_add_screen.dart';
import 'package:bsas/user/user_data_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<List<User>> getData() async {
//   var response = await http.get(Uri.parse("http://172.30.1.44:18080/api/users"));
//   if (response.statusCode == 400) {
//     List data = jsonDecode(response.body);
//     var userList = data.map((element) => User.fromJson(element)).toList();
//     return userList;
//   } else {
//     throw Exception('Failed to load user');
//   }
// }

Future<List<User>> getUserData() async {
  final response = await http.get(Uri.parse("http://172.30.1.44:18080/api/users"));
  print('Response status: ${response.statusCode}');
  if (response.statusCode == 400) {
    List data = jsonDecode(response.body);
    var userList = data.map((element) => User.fromJson(element)).toList();
    return userList;
  } else {
    throw Exception('Failed');
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State {
  late Future<List<User>> userList;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userList = getUserData();
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
        child: FutureBuilder<List<User>>(
          future: userList,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                  User user = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      title: Text(user.userName!),
                    ),
                  );
                  }
                  );
            } else if (snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF43aa8b),
        onPressed: () {
          goToDataAdd();
          // Navigator.push(context, MaterialPageRoute(builder: (_)=>AddUser()));
        },
        child: Icon(Icons.add),
        tooltip: "지인 등록",
      ),
    );
  }

  // ListView buildUserList() {
  //   List<User> data = dbHelper.getData() as List<User>;
  //
  //   return ListView.builder(
  //       itemCount: DataCount,
  //       itemBuilder: (BuildContext context, int position) {
  //         return Card(
  //           color: Colors.white,
  //           elevation: 2.0,
  //           child: ListTile(
  //             leading: CircleAvatar(
  //               backgroundColor: Color(0xFF43aa8b),
  //               child:
  //                   // Text("O"),
  //                   Icon(Icons.person, color: Colors.white),
  //             ),
  //             title: Text(
  //               data[position].userName!,
  //               style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 20,
  //                   color: Colors.black),
  //             ),
  //             subtitle: Text(
  //               data[position].userPhone!,
  //               style: TextStyle(
  //                   fontWeight: FontWeight.w600,
  //                   fontSize: 15,
  //                   color: Colors.black45),
  //             ),
  //             onTap: () {
  //               goToDetail(data[position]);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  void goToDataAdd() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddUser()));
    if (result != null) {
      if (result) {
        getUserData();
      }
    }
  }
  //
  // void getUserData() async {
  //   var productsFuture = dbHelper.getUserData();
  //   productsFuture.then((data) {
  //     setState(() {
  //       this.data = data;
  //       DataCount = (data as List).length;
  //       // DataCount = (data as List).length;
  //     });
  //   });
  // }
  //
  // void goToDetail(data) async {
  //   final result = await Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => DataDetail(data)));
  //   if (result != null) {
  //     if (result) {
  //       getUserData();
  //     }
  //   }
  // }
}
