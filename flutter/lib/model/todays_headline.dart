
class TodaysHeadline{
  int? id;
  String? title;
  String? img_url;


  TodaysHeadline({
    required this.title,
    required this.img_url,
  });

  TodaysHeadline.withId({
    this.id,
    this.title,
    this.img_url,
  });


  //json 변환
  factory TodaysHeadline.fromJson(Map<String, dynamic> json){
    return TodaysHeadline.withId(
      id: json['id'],
      title: json['title'],
      img_url: json['img_url'],
    );
  }
}