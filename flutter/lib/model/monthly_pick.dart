
class MonthlyPick{
  final int id;
  final String title;
  final String contents;
  final String img_url;

  MonthlyPick({
    required this.id,
    required this.title,
    required this.contents,
    required this.img_url,
  });

  //json 변환
  factory MonthlyPick.fromJson(Map<String, dynamic> json){
    return MonthlyPick(
      id: json['id'],
      title: json['title'] as String,
      contents: json['contents'] as String,
      img_url: json['img_url'] as String,
    );
  }
}