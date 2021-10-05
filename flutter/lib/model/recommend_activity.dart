
class RecommendActivity{
  final int id;
  final String title;
  final String img_url;


  RecommendActivity({
    required this.id,
    required this.title,
    required this.img_url,
  });

  //json 변환
  factory RecommendActivity.fromJson(Map<String, dynamic> json){
    return RecommendActivity(
      id: json['id'],
      title: json['title'] as String,
      img_url: json['img_url'] as String,
    );
  }
}