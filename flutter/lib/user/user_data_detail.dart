// import 'package:bsas/db/user_db.dart';
// import 'package:bsas/model/user_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:bsas/model/data_model.dart';
// import 'dart:convert';
// import 'package:bsas/model/user_model.dart';
// import 'package:http/http.dart' as http;
//
// class DataDetail extends StatefulWidget {
//
//   final List list;
//   final int index;
//
//   DataDetail({required this.list, required this.index});
//
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return DataDetailState();
//   }
// }
//
// // enum Options { delete, update }
//
// class DataDetailState extends State {
//
//   DBHelper userDataBaseHelper = DBHelper();
//
//   final TextEditingController _nameController = new TextEditingController();
//   final TextEditingController _phoneController = new TextEditingController();
//   final TextEditingController _emailController = new TextEditingController();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _futureUser = getUserData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFF43aa8b),
//           title: Text(
//             "편집",
//             style: TextStyle(
//                 fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
//           ),
//           centerTitle: true,
//         ),
//         body: Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(8.0),
//             child: FutureBuilder<User>(
//               future: _futureUser,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   if (snapshot.hasData) {
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(snapshot.data!.userName!),
//                         TextField(
//                           controller: _nameController,
//                           decoration: const InputDecoration(
//                             hintText: '이름을 입력하세요',
//                           ),
//                         ),
//                         Text(snapshot.data!.userPhone!),
//                         TextField(
//                           controller: _phoneController,
//                           decoration: const InputDecoration(
//                             hintText: '전화번호를 입력하세요',
//                           ),
//                         ),
//                         Text(snapshot.data!.userEmail!),
//                         TextField(
//                           controller: _nameController,
//                           decoration: const InputDecoration(
//                             hintText: '메일을 입력하세요',
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               _futureUser = updateUser(
//                                   _nameController.text, _phoneController.text,
//                                   _emailController.text);
//                             });
//                           },
//                           child: const Text('업데이트'),
//                         )
//                       ],
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//                 }
//                 return const CircularProgressIndicator();
//               },
//             )
//         )
//     );
//   }
// }
