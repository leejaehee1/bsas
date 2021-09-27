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

  _deleteUser(BuildContext context) async {
    final result = await Navigator.pushReplacement( //final
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
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
        // height: 270.0,
        padding: const EdgeInsets.all(30.0),
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
                      child: Text("Edit",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
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
                      child: Text("Delete", style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: (){
                        showDialog(context: context,
                            builder: (context){
                          return AlertDialog(
                            title: Text('경고'),
                            content: Text('정말 삭제하시겠습니까?'),
                            actions: [
                              FlatButton(onPressed: (){
                                databaseHelper.deleteUser(widget.list[widget.index]['id'].toString());
                                // setState(() {
                                //   databaseHelper.deleteUser(widget.list[widget.index]['id'].toString());
                                // });
                                _deleteUser(context);
                                // Navigator.pop(context, true);
                              },
                                child: Text('네'),
                              ),
                              FlatButton(onPressed: (){
                                Navigator.pop(context);
                              },
                                  child: Text('취소'))
                            ],
                          );
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