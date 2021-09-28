import 'package:bsas/db/center_db.dart';
import 'package:flutter/material.dart';
import 'package:bsas/db/center_db.dart';
import 'center_edit_page.dart';
import 'center_home_screen.dart';

class CenterDetail extends StatefulWidget {
  List list;
  int index;
  CenterDetail({required this.index, required this.list});

  @override
  _DetailCenterState createState() => _DetailCenterState();
}

class _DetailCenterState extends State<CenterDetail> {
  CenterDBHelper databaseHelper = CenterDBHelper();

  _deleteCenter(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CenterHomeScreen()),
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
                            builder: (BuildContext context) => EditCenter(
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
                      onPressed: (){
                        showDialog(context: context,
                            builder: (context){
                          return AlertDialog(
                            title: Text("경고"),
                            content: Text("정말 삭제하시겠습니까?"),
                            actions: [
                              FlatButton(onPressed: (){
                                databaseHelper.deleteCenter(widget.list[widget.index]['id'].toString());
                                _deleteCenter(context);
                              },
                                  child: Text('네')),
                              FlatButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("취소"))
                            ],);
                            });
                      }
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