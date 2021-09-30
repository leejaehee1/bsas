
class TodaysHeadline{
  final int id;
  final String title;
  final String img_url;

  TodaysHeadline({
    required this.id,
    required this.title,
    required this.img_url,
  });

  // TodaysHeadline.withId({
  //   this.id,
  //   this.title,
  //   this.img_url,
  // });


  //json 변환
  factory TodaysHeadline.fromJson(Map<String, dynamic> json){
    return TodaysHeadline(
      id: json['id'],
      title: json['title'] as String,
      img_url: json['img_url'] as String,
    );
  }
}