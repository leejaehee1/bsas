import 'package:flutter/material.dart';
import 'package:bsas/db/user_db.dart';
import 'user_edit_page.dart';
import 'user_home_screen.dart';

class UserDetail extends StatefulWidget {
  List list;
  int index;
  UserDetail({required this.index, required this.list});

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<UserDetail> {
  DBHelper databaseHelper = DBHelper();

  _navigateUserList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );

    if (result) {
      setState(() {});
    }
  }

  //create function delete
  void showAlertDialog(BuildContext context) async{
    String result = await showDialog(
        context: context, builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "정말 삭제하시겠습니까? '${widget.list[widget.index]['id']}'"),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "OK remove!",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.red,
                onPressed: () {
                  databaseHelper
                      .deleteUser(widget.list[widget.index]['id'].toString());
                  _navigateUserList(context);
                },
              ),
              RaisedButton(
                child: Text("CANCEL", style: TextStyle(color: Colors.black)),
                color: Colors.green,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
    });
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
                            builder: (BuildContext context) => EditUser(
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
                      onPressed: () => showAlertDialog(context),
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