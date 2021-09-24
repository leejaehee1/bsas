import 'package:flutter/cupertino.dart';

class RecommendHotspot{
  int? id;
  String? title;
  String? img_url;
  String? contents;


  RecommendHotspot({
    required this.title,
    required this.img_url,
    required this.contents,
  });

  RecommendHotspot.withId({
    this.id,
    this.title,
    this.img_url,
    this.contents,
  });


  //json 변환
  factory RecommendHotspot.fromJson(Map<String, dynamic> json){
    return RecommendHotspot.withId(
      // id : int.parse(json['id'].toString()),
      id: json['id'],
      title: json['title'],
      img_url: json['img_url'],
      contents: json['contents'],
    );
  }
}