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
    var response = await http.get(Uri.parse("http://54.180.102.153:18080/api/recommendActivity"));
    return json.decode(response.body);
  }

  _navigateAddQuestion(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => AddQuestion()));
    if(result) {
      setState(() {

      });
    }
  }

  @override
  void initState(){
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
        title: const Text('고객센터',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),
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
        builder: (context, snapshot){
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? QuestionList(
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

class QuestionList extends StatelessWidget {
  final List list;
  QuestionList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuestionDetail(
                      list: list,
                      index: i,
                    ))
                ),
                child: SizedBox(
                  height: 100,
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
                                list[i]['title'].toString(),
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                list[i]['contents'].toString(),
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.black87),
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
