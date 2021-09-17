class Hospital{
  int? id;
  String? hospitlaName;
  String? hospitlaPhone;
  String? hospitlaPublicPhone;
  String? hospitlaEmail;


  Hospital({
    required this.hospitlaName,
    required this.hospitlaPhone,
    required this.hospitlaPublicPhone,
    required this.hospitlaEmail,
  });

  Hospital.withId({
    this.id,
    this.hospitlaName,
    this.hospitlaPhone,
    this.hospitlaPublicPhone,
    this.hospitlaEmail,
  });


  //json 변환
  factory Hospital.fromJson(Map<String, dynamic> json){
    return Hospital.withId(
      id: json['id'],
      hospitlaName: json['hospitlaName'],
      hospitlaPhone: json['hospitlaPhone'],
      hospitlaPublicPhone : json['hospitlaPublicPhone'],
      hospitlaEmail: json['hospitlaEmail'],
    );
  }
}