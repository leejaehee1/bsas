class Member {
  final int id; // 0 : other or 1 : my
  final String memberId;
  final String memberPwd;
  final String created_date;
  final String modified_date;

  Member(
      {required this.id,
      required this.memberId,
      required this.memberPwd,
      required this.created_date,
      required this.modified_date});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        id: json['id'],
        memberId: json['memberId'],
        memberPwd: json['memberPwd'],
        created_date: json['created_date'],
        modified_date: json['modified_date']);
  }
}