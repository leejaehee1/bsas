import 'package:bsas/db/customer_question_db.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'customer_question/add_question.dart';
import 'customer_question/question_detail.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List? list;

  Future<List> getQuestionData() async {
    var response = await http
        .get(Uri.parse("http://54.180.102.153:18080/api/recommendActivity"));
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
      body: FutureBuilder<List>(
        future: getQuestionData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? _buildQuestion(
                  list: snapshot.data!,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class _buildQuestion extends StatefulWidget {
  final List list;

  const _buildQuestion({required this.list});

  @override
  State<_buildQuestion> createState() => _buildQuestionState();
}

class _buildQuestionState extends State<_buildQuestion> {
  CustomerDbHelper questionDbHelper = CustomerDbHelper();

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
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionDetail(
                              list: widget.list,
                              index: i,
                            ))),
                child: SizedBox(
                  height: 130,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // add this
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                widget.list[i]['title'].toString(),
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.black87),
                              ),
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
                                    style: TextStyle(color: Colors.redAccent),
                                  )),
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
