import 'package:flutter/cupertino.dart';

class RecommendActivity{
  int? id;
  String? title;
  String? img_url;
  String? contents;


  RecommendActivity({
    required this.title,
    required this.img_url,
    required this.contents,
  });

  RecommendActivity.withId({
    this.id,
    this.title,
    this.img_url,
    this.contents,
  });


  //json 변환
  factory RecommendActivity.fromJson(Map<String, dynamic> json){
    return RecommendActivity.withId(
      // id : int.parse(json['id'].toString()),
      id: json['id'],
      title: json['title'],
      img_url: json['img_url'],
      contents: json['contents'],
    );
  }
}