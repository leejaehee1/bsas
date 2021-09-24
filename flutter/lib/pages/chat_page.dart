import 'package:bsas/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/components/chat_icon_button.dart';
import '/components/my_chat.dart';
import '/components/other_chat.dart';
import '/components/time_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/model/chat.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatViewModel viewModel = ChatViewModel();

  final List<MyChat> chats = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFb2c7da),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "홍길동",
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            Icon(FontAwesomeIcons.search, size: 20),
            // SizedBox(width: 25),
            Icon(FontAwesomeIcons.bars, size: 20),
            // SizedBox(width: 25),
          ],
        ),
        body: Column(
          children: [
            FutureBuilder<List<Chat>>(
              future: this.viewModel.fetchPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.first.type == 0) {
                    return OtherChat(
                      name: '${snapshot.data!.first.name}',
                      text: '${snapshot.data!.first.text}',
                      time: '${snapshot.data!.first.time}',
                    );
                  } else {
                    return MyChat(
                      text: '${snapshot.data!.first.text}',
                      time: '${snapshot.data!.first.time}',
                    );
                  }
                }

                // 기본적으로 로딩 Spinner를 보여줍니다.
                return CircularProgressIndicator();
              },
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  ChatIconButton(icon: Icon(FontAwesomeIcons.plusSquare)),
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _textController,
                        // 1
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onSubmitted: _handleSubmitted, // 2
                      ),
                    ),
                  ),
                  ChatIconButton(icon: Icon(FontAwesomeIcons.smile)),
                  ChatIconButton(icon: Icon(FontAwesomeIcons.cog)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear(); // 1

    setState(() {
      // 2
      chats.add(
        MyChat(
          text: text,
          time: DateFormat("a K:m") // 3
              .format(new DateTime.now())
              .replaceAll("AM", "오전")
              .replaceAll("PM", "오후"),
        ),
      );
    });
  }
}
