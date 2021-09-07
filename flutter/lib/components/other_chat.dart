import 'package:flutter/material.dart';

class OtherChat extends StatelessWidget {
  const OtherChat({
    Key? key,
    required this.name,
    required this.text,
    required this.time,
  }) : super(key: key);

  final String name;
  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-8-avatar-2754583_120515.png"), // 1
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Container(
                  child: Text(text),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(time, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}