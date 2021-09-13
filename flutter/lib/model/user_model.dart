class User {
  final int id; // 0 : other or 1 : my
  final String userName;
  final String userPhone;
  final String userEmail;
  final String created_date;
  final String modified_date;

  User(
      {required this.id,
        required this.userName,
        required this.userPhone,
        required this.userEmail,
        required this.created_date,
        required this.modified_date});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        userName: json['userName'],
        userPhone: json['userPhone'],
        userEmail: json['userEmail'],
        created_date: json['created_date'],
        modified_date: json['modified_date']);
  }
}