import 'package:flutter/material.dart';
import 'package:plms_start/pages/utils/checkbox_register.dart';
import 'package:plms_start/screens/utils/dropbox_text2.dart';
// import 'package:plms_start/pages/utils/textfield_register.dart';
// import 'package:plms_start/screens/utils/textfield_text.dart';

class FirstRegister extends StatefulWidget {
  FirstRegister({Key? key}) : super(key: key);

  @override
  _FirstRegisterState createState() => _FirstRegisterState();
}

class _FirstRegisterState extends State<FirstRegister> {
  final _idTextEditController = TextEditingController();
  final _pwTextEditController = TextEditingController();
  final _repwTextEditController = TextEditingController();
  final _emailTextEditController = TextEditingController();
  final _comTextEditController = TextEditingController();
  final _nameTextEditController = TextEditingController();
  final _personalTextEditController = TextEditingController();

  @override
  void dispose() {
    _idTextEditController.dispose();
    _pwTextEditController.dispose();
    _repwTextEditController.dispose();
    _emailTextEditController.dispose();
    _comTextEditController.dispose();
    _nameTextEditController.dispose();
    _personalTextEditController.dispose();
    super.dispose();
  }

  List<dynamic> dataList = [];

  @override
  Widget build(BuildContext context) {
    // bool isSwitched = false;
    return Container(
      // height: MediaQuery.of(context).size.height,
      color: Color(0xFFE6E6E6),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xffB7C5B9),
                offset: Offset(-7, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CheckBoxButton(name: 'Assignee'),
                    CheckBoxButton(name: 'QC'),
                    CheckBoxButton(name: 'Manager'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    _textField("User ID", _idTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("Password", _pwTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("Retry Pasword", _repwTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("E-mail", _emailTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("Company", _comTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("User Name", _nameTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("Personal ID", _personalTextEditController),
                    DropboxText2(text: "Department"),
                    ElevatedButton(
                        onPressed: () {
                          // print(_idTextEditController.text);
                          // print(_pwTextEditController.text);
                          // print(_repwTextEditController.text);
                          // print(_emailTextEditController.text);
                          // print(_comTextEditController.text);
                          // print(_nameTextEditController.text);
                          // print(_personalTextEditController.text);
                          print(dataList);
                        },
                        child: Text('test')),
                    Column(
                      children: [
                        // Text(_idTextEditController.text),
                        // Text(_pwTextEditController.text),
                        // Text(_repwTextEditController.text),
                        // Text(_emailTextEditController.text),
                        // Text(_comTextEditController.text),
                        // Text(_nameTextEditController.text),
                        // Text(_personalTextEditController.text),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(String title, var controller) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(title)),
        SizedBox(
          width: 200,
          height: 30,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              setState(() {
                dataList.add(controller.text);
              });
            },
          ),
        ),
      ],
    );
  }
}
