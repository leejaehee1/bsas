import 'package:bsas/db/center_db.dart';
import 'package:flutter/material.dart';

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

  _navigateCenterList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CenterHomeScreen()),
    );

    if (result) {
      setState(() {});
    }
  }

  //create function delete
  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "정말 삭제하시겠습니까? '${widget.list[widget.index]['name']}'"),
      actions: <Widget>[
        RaisedButton(
          child: Text(
            "OK remove!",
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            databaseHelper
                .deleteCenter(widget.list[widget.index]['name'].toString());
            _navigateCenterList(context);
          },
        ),
        RaisedButton(
          child: Text("CANCEL", style: TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: () => confirm(),
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