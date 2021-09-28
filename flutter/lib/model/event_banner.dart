
class Banner{
  int? id;
  String? title;
  String? img_url;
  String? contents;


  Banner({
    required this.title,
    required this.img_url,
    required this.contents
  });

  Banner.withId({
    this.id,
    this.title,
    this.img_url,
    this.contents,
  });


  //json 변환
  factory Banner.fromJson(Map<String, dynamic> json){
    return Banner.withId(
      id: json['id'],
      title: json['title'],
      img_url: json['img_url'],
      contents: json['contents']
    );
  }
}