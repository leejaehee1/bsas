class Authority {
  final String authority;
  final String authName;
  final String remarks;

  Authority(
      {required this.authority, required this.authName, required this.remarks});

  factory Authority.fromJson(Map<String, dynamic> parsedJson) {
    return Authority(
      authority: parsedJson['authority'],
      authName: parsedJson['authName'],
      remarks: parsedJson['remarks'],
    );
  }
}
