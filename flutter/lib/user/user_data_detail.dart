import 'package:flutter/material.dart';
import 'package:bsas/db/database.dart';
import 'package:bsas/model/data_model.dart';

class DataDetail extends StatefulWidget {
  Data data;
  DataDetail(this.data);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DataDetailState(data);
  }
}

enum Options { delete, update }

class DataDetailState extends State {
  Data data;
  DataDetailState(this.data);
  var dbHelper = DatabaseHelper();
  // var dbHelper = DBHelper();
  var txtName = TextEditingController();
  var txtpublicPhone = TextEditingController();
  var txtmail = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    txtName.text = data.name!;
    txtpublicPhone.text = data.publicPhone!;
    txtmail.text = data.mail!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text(
          "편집 : ${data.name}",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              PopupMenuItem<Options>(
                value: Options.delete,
                child: Text("삭제"),
              ),
              PopupMenuItem<Options>(
                value: Options.update,
                child: Text("업데이트"),
              ),
            ],
          )
        ],
      ),
      body: buildDataDetail(),
    );
  }

  Widget buildDataDetail() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          buildName(),
          buildPublicPhone(),
          buildMail(),
        ],
      ),
    );
  }

  Widget buildName() {
    return TextField(
      decoration: InputDecoration(
        labelText: "이름 : ",
      ),
      controller: txtName,
    );
  }

  Widget buildPublicPhone() {
    return TextField(
      decoration: InputDecoration(
        labelText: "연락처 : ",
      ),
      controller: txtpublicPhone,
    );
  }

  Widget buildMail() {
    return TextField(
      decoration: InputDecoration(
        labelText: "이메일 : ",
      ),
      controller: txtmail,
    );
  }

  void selectProcess(Options options) async {
    //print(value);
    switch (options) {
      case Options.delete:
        await dbHelper.deleteUserData(data.id!);
        Navigator.pop(context, true);
        break;
      case Options.update:
        await dbHelper.updateUserData(Data.withId(
          id: data.id,
          name: txtName.text,
          publicPhone: txtpublicPhone.text,
          mail: txtmail.text,
          // type: data.type
        ));
        Navigator.pop(context, true);
        break;
      default:
    }
  }
}