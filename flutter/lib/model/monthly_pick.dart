import 'package:flutter/cupertino.dart';

class MonthlyPick{
  int? id;
  String? title;
  String? img_url;
  String? contents;


  MonthlyPick({
    required this.title,
    required this.img_url,
    required this.contents,
  });

  MonthlyPick.withId({
    this.id,
    this.title,
    this.img_url,
    this.contents,
  });


  //json 변환
  factory MonthlyPick.fromJson(Map<String, dynamic> json){
    return MonthlyPick.withId(
      // id : int.parse(json['id'].toString()),
      id: json['id'],
      title: json['title'],
      img_url: json['img_url'],
      contents: json['contents'],
    );
  }
}