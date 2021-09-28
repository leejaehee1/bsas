import 'package:bsas/db/hospital_db.dart';
import 'package:bsas/hospital/hospital_edit_page.dart';
import 'package:flutter/material.dart';
import 'hospital_home_screen.dart';

class HospitalDetail extends StatefulWidget {
  List list;
  int index;
  HospitalDetail({required this.index, required this.list});

  @override
  _DetailHospitalState createState() => _DetailHospitalState();
}

class _DetailHospitalState extends State<HospitalDetail> {
  HospitalDBHelper databaseHelper = HospitalDBHelper();

  _deleteHospital(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HosHomeScreen()),
    );

    if (result) {
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text(
          "상제 정보",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Text(
                  widget.list[widget.index]['name'],
                  style:TextStyle(fontSize: 20.0),
                ),
                Divider(),
                Text(
                  "phone : ${widget.list[widget.index]['phone']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Edit"),
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => EditHospital(
                              list: widget.list,
                              index: widget.index,
                            ),
                          )),
                    ),
                    VerticalDivider(),
                    RaisedButton(
                      child: Text("Delete"),
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        showDialog(context: context,
                            builder: (context) {
                          return AlertDialog(
                            title: Text("경고"),
                            content: Text("정말 삭제하시겠습니까?"),
                            actions: [
                              FlatButton(onPressed: (){
                                databaseHelper.deleteHospital(widget.list[widget.index]['id'].toString());
                                _deleteHospital(context);
                              },
                                  child: Text('네')),
                              FlatButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text('취소'))
                            ],);
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}