import 'package:flutter/cupertino.dart';

class User{
  int? id;
  String? userName;
  String? userPhone;
  String? userEmail;
  String? created_date;
  String? modified_date;


  User({
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    // this.personPhone,
  });

  User.withId({
    this.id,
    this.userName,
    this.userPhone,
    this.userEmail,
    // this.personPhone,
  });


  // Map<String, dynamic> toJson(){
  //   final json = Map<String, dynamic>();
  //
  //   // if(id != null){
  //   //   json['id'] = id;
  //   // }
  //   // else if(personPhone != null) {
  //   //   json['personPhone'] = personPhone;
  //   // }
  //   json['id'] = id;
  //   json['name'] = userName;
  //   json['publicPhone'] = userPhone;
  //   json['mail'] = userEmail;
  //   return json;
  // }

  //json 변환
  factory User.fromJson(Map<String, dynamic> json){
    return User.withId(
      // id : int.parse(json['id'].toString()),
      id: json['id'],
      userName: json['name'],
      userPhone: json['publicPhone'],
      userEmail: json['mail'],
      // personPhone: json['personPhone'],
    );
  }
}