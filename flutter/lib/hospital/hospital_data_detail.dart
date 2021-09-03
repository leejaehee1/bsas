import 'package:flutter/material.dart';
import 'package:bsas/db/database.dart';
import 'package:bsas/model/data_model.dart';

class HosDataDetail extends StatefulWidget {
  Data data;
  HosDataDetail(this.data);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HosDataDetailState(data);
  }
}

enum Options { delete, update }

class HosDataDetailState extends State {
  Data data;

  HosDataDetailState(this.data);

  var dbHelper = DatabaseHelper();
  var txtName = TextEditingController();
  var txtpublicPhone = TextEditingController();
  var txtmail = TextEditingController();
  var txtpersonPhone = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    txtName.text = data.name!;
    txtpublicPhone.text = data.publicPhone!;
    txtmail.text = data.mail!;
    txtpersonPhone.text = data.personPhone!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "편집 : ${data.name}",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<Options>>[
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
          buildPersonPhone(),
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

  Widget buildPersonPhone() {
    return TextField(
      decoration: InputDecoration(
        labelText: "담당자 연락처 : ",
      ),
      controller: txtpersonPhone,
    );
  }

  void selectProcess(Options options) async {
    //print(value);
    switch (options) {
      case Options.delete:
        await dbHelper.deleteHospitalData(data.id!);
        Navigator.pop(context, true);
        break;
      case Options.update:
        await dbHelper.updateHospitalData(Data.withId(
          id: data.id,
          name: txtName.text,
          publicPhone: txtpublicPhone.text,
          mail: txtmail.text,
          personPhone: txtpersonPhone.text,
          // type: data.type
        ));
        Navigator.pop(context, true);
        break;
      default:
    }
  }
}
