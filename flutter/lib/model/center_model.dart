class Center{
  int? id;
  String? centerName;
  String? centerPhone;
  String? cetnerPublicPhone;
  String? centerEmail;


  Center({
    required this.centerName,
    required this.centerPhone,
    required this.cetnerPublicPhone,
    required this.centerEmail,
  });

  Center.withId({
    this.id,
    this.centerName,
    this.centerPhone,
    this.cetnerPublicPhone,
    this.centerEmail,
  });


  //json 변환
  factory Center.fromJson(Map<String, dynamic> json){
    return Center.withId(
      id: json['id'],
      centerName: json['centerName'],
      centerPhone: json['centerPhone'],
      cetnerPublicPhone : json['centerPublicPhone'],
      centerEmail: json['centerEmail'],
    );
  }
}