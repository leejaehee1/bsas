import 'package:bsas/db/user_db.dart';
import 'package:bsas/user/user_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  TextEditingController _idController = TextEditingController();

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
    _idController = new TextEditingController(
        text: widget.list[widget.index]['id'].toString());
    _nameController = TextEditingController(
        text: widget.list[widget.index]['name'].toString());
    _phoneController = TextEditingController(
        text: widget.list[widget.index]['phone'].toString());
    _emailController = TextEditingController(
        text: widget.list[widget.index]['email'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) return "name";
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: TextFormField(
                    controller: _phoneController,
                    validator: (value) {
                      if (value!.isEmpty) return "Phone";
                    },
                    decoration: InputDecoration(
                      hintText: "Phone",
                      labelText: "Phone",
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.black),
                  title: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) return "Email";
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text("Edit"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    databaseHelper.updateUser(
                      _idController.text.trim(),
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