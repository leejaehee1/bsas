import 'package:flutter/cupertino.dart';

class accountData{
  int? id;
  String? name;
  String? password;

  accountData({
    // this.id,
    required this.name,
    required this.password,
  });

  accountData.withId({
    this.id,
    this.name,
    this.password,
  });

  Map<String, dynamic> toJson(){
    final json = Map<String, dynamic>();

    if(id != null){
      json['id'] = id;
    }
    // else if(personPhone != null) {
    //   json['personPhone'] = personPhone;
    // }
    json['name'] = name;
    json['password'] = password;
    return json;
  }

  //json 변환
  factory accountData.fromJson(Map<String, dynamic> json){
    return accountData.withId(
      id : int.parse(json['id'].toString()),
      name: json['name'],
      password: json['password'],
    );
    // id = int.tryParse(a['id'].toString());
    // name = a['name'];
    // publicPhone = a['publicPhone'];
    // mail = a['mail'];
    // personPhone = a['personPhone'];
    // type = int.tryParse(a['type'].toString());

  }

}