import 'package:bsas/db/user_db.dart';
import 'package:bsas/model/user_model.dart';
import 'package:bsas/user/user_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bsas/model/data_model.dart';
import 'dart:convert';
import 'package:bsas/model/user_model.dart';
import 'package:http/http.dart' as http;

class EditUser extends StatefulWidget {
  final List list;
  final int index;

  EditUser({required this.list, required this.index});

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  DBHelper databaseHelper = DBHelper();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  _navigateUserList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()));

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _nameController = TextEditingController(
        text: widget.list[widget.index]['name'].toString());
    _phoneController = TextEditingController(
        text: widget.list[widget.index]['price'].toString());
    _emailController = TextEditingController(
        text: widget.list[widget.index]['email'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) return "name";
                    },
                    decoration: new InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    controller: _phoneController,
                    validator: (value) {
                      if (value!.isEmpty) return "Phone";
                    },
                    decoration: new InputDecoration(
                      hintText: "Phone",
                      labelText: "Phone",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.black),
                  title: new TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) return "Email";
                    },
                    decoration: new InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    databaseHelper.updateUser(
                        _nameController.text.trim(),
                        _phoneController.text.trim(),
                        _emailController.text.trim(),
                    );
                    _navigateUserList(context);
                    },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}