// import 'package:bsas/db/customer_question_db.dart';
// import 'package:flutter/material.dart';
//
// import '../question_page.dart';
//
//
// class QuestionDetail extends StatefulWidget {
//
//   List list;
//   int? index;
//   QuestionDetail({this.index, required this.list});
//
//   @override
//   _QuestionListState createState() => _QuestionListState();
// }
//
// class _QuestionListState extends State<QuestionDetail> {
//
//   late List list;
//   int? index;
//
//   CustomerDbHelper questionDbHelper = CustomerDbHelper();
//
//   _deleteQuestion(BuildContext context) async {
//     final result = await Navigator.pushReplacement( //final
//       context,
//       MaterialPageRoute(builder: (context) => QuestionPage()),
//     );
//     if (result) {
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: list == null ? 0 : list.length,
//       itemBuilder: (context, i) {
//         return Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(10.0),
//               child: GestureDetector(
//                 onTap: () => Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => QuestionDetail(
//                       list: list,
//                       index: i,
//                     ))
//                 ),
//                 child: SizedBox(
//                   height: 120,
//                   child: Card(
//                     color: Colors.white,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min, // add this
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 list[i]['title'].toString(),
//                                 style: const TextStyle(
//                                     fontSize: 20.0, color: Colors.black87),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 list[i]['contents'].toString(),
//                                 style: const TextStyle(color: Colors.black87),
//                               ),
//                               TextButton(onPressed: (){
//                                 showDialog(context: context,
//                                     builder: (context) {
//                                   return AlertDialog(
//                                     title: Text('경고'),
//                                     content: Text('정말 삭제하시겠습니까?'),
//                                     actions: [
//                                       FlatButton(onPressed: (){
//                                         questionDbHelper.deleteQuestion(list[i]['id'].toString());
//                                         _deleteQuestion(context);
//                                       }, child: Text('네'),
//                                       ),
//                                       FlatButton(onPressed: (){
//                                         Navigator.pop(context);
//                                       }, child: Text('취소'))
//                                     ],
//                                   );
//                                     });
//                               },
//                                   child: Text("삭제", style: TextStyle(color: Colors.redAccent),))
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
