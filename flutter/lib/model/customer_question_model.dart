
class CustomerQuestion{
  final int id;
  final String title;
  final String contents;
  // final String img_url;


  CustomerQuestion({
    required this.id,
    required this.title,
    required this.contents,
    // required this.img_url,
  });

  //json 변환
  factory CustomerQuestion.fromJson(Map<String, dynamic> json){
    return CustomerQuestion(
      id: json['id'],
      title: json['title'] as String,
      contents: json['contents'] as String,
      // img_url: json['img_url'] as String,
    );
  }
}