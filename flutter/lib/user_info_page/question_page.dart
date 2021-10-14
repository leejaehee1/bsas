import 'package:bsas/db/customer_question_db.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'detail_question_page/add_question.dart';
import 'detail_question_page/edit_question.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List? list;

  // 고객센터 -> 문의사항 데이터 불러오기
  Future<List> getQuestionData() async {
    var response = await http
        .get(Uri.parse("http://54.180.102.153:18080/api/monthlyPick"));
    return json.decode(response.body);
  }


  _navigateAddQuestion(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (_) => const AddQuestion()));
    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getQuestionData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          '고객센터',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0ab27d),
        onPressed: () => _navigateAddQuestion(context),
        child: const Icon(Icons.add),
      ),
      body: Column(children: [
        Container(
          child: const ListTile(
            leading: Text(
              "문의 내역",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 15), //greyColor Color(0xFFBDBDBD)
            ),
          ),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xFFEEEEEE)))),
        ),
        SizedBox(
          height: 550,
          child: FutureBuilder<List>(
            future: getQuestionData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? _buildQuestion( //_buildQuestion class에서 각 데이터를 가져옴
                      list: snapshot.data!,
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ]),
    );
  }
}

// 문의사항 데이터를 get
class _buildQuestion extends StatefulWidget {
  final List list;

  _buildQuestion({required this.list});

  @override
  State<_buildQuestion> createState() => _buildQuestionState();
}

class _buildQuestionState extends State<_buildQuestion> {

  CustomerDbHelper questionDbHelper = CustomerDbHelper();
  final dateTime = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // 문의사항 삭제
  _deleteQuestion(BuildContext context) async {
    var result = await Navigator.pushReplacement(
      //final
      context,
      MaterialPageRoute(builder: (context) => const QuestionPage()),
    );
    if (result) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditQuestion(
                              list: widget.list,
                              index: i,
                            ))),
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 0.3,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // add this
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.list[i]['title'].toString(),
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.black87),
                              ),
                              Text(
                                dateTime,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.list[i]['contents'].toString(),
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.black87),
                              ),
                              TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('경고'),
                                            content: const Text('정말 삭제하시겠습니까?'),
                                            actions: [
                                              FlatButton(
                                                  onPressed: () {
                                                    questionDbHelper
                                                        .deleteQuestion(widget
                                                            .list[i]['id']
                                                            .toString());

                                                    _deleteQuestion(context);
                                                  },
                                                  child: const Text('네')),
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('취소'))
                                            ],
                                          );
                                        });
                                  },
                                  child: const Text(
                                    "삭제",
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ExpansionTile(
                              title: const Text(
                                '답변',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF0ab27d),
                                    fontWeight: FontWeight.w600),
                              ),
                              children: [
                                ListTile(
                                  title: Text(
                                    widget.list[i]['contents'].toString(), // 문의사항에 대한 답변 불러옴 -> 향후 답변 필드를 추가해야함 + 백에서도 추가 필요
                                    style:
                                    const TextStyle(fontSize: 20.0, color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
