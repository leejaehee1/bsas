import 'package:flutter/cupertino.dart';

class TodayHeadline{
  int? id;
  String? title;
  String? img_url;
  String? contents;


  TodayHeadline({
    required this.title,
    required this.img_url,
    required this.contents,
  });

  TodayHeadline.withId({
    this.id,
    this.title,
    this.img_url,
    this.contents,
  });


  //json 변환
  factory TodayHeadline.fromJson(Map<String, dynamic> json){
    return TodayHeadline.withId(
      // id : int.parse(json['id'].toString()),
      id: json['id'],
      title: json['title'],
      img_url: json['img_url'],
      contents: json['contents'],
    );
  }
}