class UserModel {
  String category;
  String categoryName;

  UserModel({required this.category, required this.categoryName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      category: json['category'],
      categoryName: json['categoryName'],
    );
  }
  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  @override
  String toString() => category;
}
