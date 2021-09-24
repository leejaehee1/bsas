import 'package:flutter/cupertino.dart';

class EventDay{
  int? id;
  String? title;
  String? img_url;
  String? contents;


  EventDay({
    required this.title,
    required this.img_url,
    required this.contents,
  });

  EventDay.withId({
    this.id,
    this.title,
    this.img_url,
    this.contents,
  });


  //json 변환
  factory EventDay.fromJson(Map<String, dynamic> json){
    return EventDay.withId(
      // id : int.parse(json['id'].toString()),
      id: json['id'],
      title: json['title'],
      img_url: json['img_url'],
      contents: json['contents'],
    );
  }
}