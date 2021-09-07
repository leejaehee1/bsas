class Chat {
  final int type; // 0 : other or 1 : my
  final String avatarUrl;
  final String name;
  final String text;
  final String time;

  Chat(
      {required this.type,
      required this.avatarUrl,
      required this.name,
      required this.text,
      required this.time});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
        type: json['type'],
        avatarUrl: json['avatarUrl'],
        name: json['name'],
        text: json['text'],
        time: json['time']);
  }
}
List<Chat> chats = [
  Chat(
    type: 0,
    avatarUrl:
        "https://raw.githubusercontent.com/flutter-coder/ui_images/master/messenger",
    name: "홍건적",
    text: "알고리즘 해결 했어요",
    time: "오전 10:00",
  ),
  Chat(
    type: 1,
    avatarUrl: "",
    name: "적토마",
    text: "오늘 점심에 시간 되시나요?",
    time: "오후 12:20",
  ),
];
