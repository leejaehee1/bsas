class User {
  final List result;
  final String test;
  final String error;

  User({required this.result, required this.test, required this.error});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['result'] as List;
    return User(
      result: list,
      test: parsedJson['test'],
      error: parsedJson['error'],
    );
  }
}
