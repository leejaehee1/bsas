
class EventDay{
  int? id;
  String? title;
  String? img_url;


  EventDay({
    required this.title,
    required this.img_url,
  });

  EventDay.withId({
    this.id,
    this.title,
    this.img_url,
  });


  //json 변환
  factory EventDay.fromJson(Map<String, dynamic> json){
    return EventDay.withId(
      id: json['id'],
      title: json['title'],
      img_url: json['img_url'],
    );
  }
}