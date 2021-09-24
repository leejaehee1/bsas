// import 'package:bsas/db/user_db.dart';
// import 'package:bsas/model/user_model.dart';
// import 'package:bsas/user/user_home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:bsas/db/database.dart';
// import 'package:bsas/model/data_model.dart';
//
// class EditUser extends StatefulWidget {
//   final List list;
//   final int index;
//
//   EditUser({required this.list, required this.index});
//
//   @override
//   _EditUserState createState() => _EditUserState();
// }
//
// enum Options { delete, update }
//
// class _EditUserState extends State<EditUser> {
//
//  late List list;
//
//   DBHelper databaseHelper = DBHelper();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _idController = TextEditingController();
//
//   _navigateUserList(BuildContext context) async {
//     final result = await Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()));
//
//     if (result) {
//       setState(() {});
//     }
//   }
//
//   @override
//   void initState() {
//     _idController = new TextEditingController(
//         text: widget.list[widget.index]['id'].toString());
//     _nameController = TextEditingController(
//         text: widget.list[widget.index]['name'].toString());
//     _phoneController = TextEditingController(
//         text: widget.list[widget.index]['phone'].toString());
//     _emailController = TextEditingController(
//         text: widget.list[widget.index]['email'].toString());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF43aa8b),
//         title: Text(
//           "편집 : '${widget.list[widget.index]['name']}'",
//           style: TextStyle(
//               fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
//         ),
//         centerTitle: true,
//         actions: <Widget>[
//           PopupMenuButton<Options>(
//             onSelected: selectProcess,
//             itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
//               PopupMenuItem<Options>(
//                 value: Options.delete,
//                 child: Text("삭제"),
//               ),
//               PopupMenuItem<Options>(
//                 value: Options.update,
//                 child: Text("업데이트"),
//               ),
//             ],
//           )
//         ],
//       ),
//       body: buildlistDetail(),
//     );
//   }
//
//   Widget buildlistDetail() {
//     return Padding(
//       padding: EdgeInsets.all(30.0),
//       child: Column(
//         children: <Widget>[
//           buildId(),
//           buildName(),
//           buildPublicPhone(),
//           buildMail(),
//         ],
//       ),
//     );
//   }
//
//  Widget buildId() {
//    return TextField(
//      decoration: InputDecoration(
//        labelText: "아이디 : ",
//      ),
//      controller: _idController,
//    );
//  }
//
//   Widget buildName() {
//     return TextField(
//       decoration: InputDecoration(
//         labelText: "이름 : ",
//       ),
//       controller: _nameController,
//     );
//   }
//
//   Widget buildPublicPhone() {
//     return TextField(
//       decoration: InputDecoration(
//         labelText: "연락처 : ",
//       ),
//       controller: _phoneController,
//     );
//   }
//
//   Widget buildMail() {
//     return TextField(
//       decoration: InputDecoration(
//         labelText: "이메일 : ",
//       ),
//       controller: _emailController,
//     );
//   }
//
//   void selectProcess(Options options) async {
//     //print(value);
//     switch (options) {
//       case Options.delete:
//         await databaseHelper.deleteUser(widget.list[widget.index]['id'].toString());
//         Navigator.pop(context, true);
//         break;
//       case Options.update:
//         await databaseHelper.updateUser(
//           _idController.text.trim(),
//           _nameController.text.trim(),
//           _phoneController.text.trim(),
//           _emailController.text.trim(),
//         );
//         Navigator.pop(context, true);
//         break;
//       default:
//     }
//   }
// }