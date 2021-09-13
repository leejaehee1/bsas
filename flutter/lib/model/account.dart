class Member {
  final int id; // 0 : other or 1 : my
  final String accountId;
  final String accountPwd;
  final String created_date;
  final String modified_date;

  Member(
      {required this.id,
        required this.accountId,
        required this.accountPwd,
        required this.created_date,
        required this.modified_date});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        id: json['id'],
        accountId: json['accountId'],
        accountPwd: json['accountPwd'],
        created_date: json['created_date'],
        modified_date: json['modified_date']);
  }
}