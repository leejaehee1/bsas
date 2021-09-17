import 'package:bsas/db/hospital_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hospital_home_screen.dart';

class EditHospital extends StatefulWidget {
  final List list;
  final int index;

  EditHospital({required this.list, required this.index});

  @override
  _EditHospitalState createState() => _EditHospitalState();
}

class _EditHospitalState extends State<EditHospital> {

  HospitalDBHelper databaseHelper = HospitalDBHelper();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _publicPhoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  _navigateHospitalList(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HosHomeScreen()));

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _nameController = TextEditingController(
        text: widget.list[widget.index]['name'].toString());
    _phoneController = TextEditingController(
        text: widget.list[widget.index]['phone'].toString());
    _publicPhoneController = TextEditingController(
        text: widget.list[widget.index]['publicPhone'].toString());
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
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: TextFormField(
                    controller: _publicPhoneController,
                    validator: (value) {
                      if (value!.isEmpty) return "PublicPhone";
                    },
                    decoration: InputDecoration(
                      hintText: "PublicPhone",
                      labelText: "PublicPhone",
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
                    databaseHelper.updateHospital(
                      _nameController.text.trim(),
                      _phoneController.text.trim(),
                      _publicPhoneController.text.trim(),
                      _emailController.text.trim(),
                    );
                    _navigateHospitalList(context);
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