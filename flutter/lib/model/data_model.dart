import 'package:flutter/cupertino.dart';

class Data{
  int? id;
  int? type;
  String? name;
  String? publicPhone;
  String? mail;
  String? personPhone;
  // final int? status;

  Data({
    // this.id,
    required this.name,
    required this.publicPhone,
    required this.mail,
    this.personPhone,
  });

  Data.withId({
    this.id,
    this.name,
    this.publicPhone,
    this.mail,
    this.personPhone,
  });

  // Map<String, dynamic> toJson() =>
  //     {
  //       'name' : name,
  //     'publicPhone' : publicPhone,
  //     'mail' : mail,
  //     'personPhone' : personPhone};

  Map<String, dynamic> toJson(){
    final json = Map<String, dynamic>();

    if(id != null){
      json['id'] = id;
    }
    else if(personPhone != null) {
      json['personPhone'] = personPhone;
    }
    json['name'] = name;
    json['publicPhone'] = publicPhone;
    json['mail'] = mail;
    return json;
  }

  //json 변환
  factory Data.fromJson(Map<String, dynamic> json){
    return Data.withId(
      id : int.parse(json['id'].toString()),
      name: json['name'],
      publicPhone: json['publicPhone'],
      mail: json['mail'],
      personPhone: json['personPhone'],
    );
  }
}