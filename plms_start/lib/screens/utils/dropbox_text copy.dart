// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'package:plms_start/screens/models/model.dart';
// import 'package:plms_start/screens/provider/data_Provider.dart';

// import 'dart:convert';

// import 'package:provider/provider.dart';

// class DropboxText extends StatefulWidget {
//   final String text;

//   DropboxText({Key? key, required this.text}) : super(key: key);

//   @override
//   _DropboxTextState createState() => _DropboxTextState();
// }

// class _DropboxTextState extends State<DropboxText> {
//   @override
//   Widget build(BuildContext context) {
//     final postProvider = Provider.of<PostProvider>(context);
//     var postDatas = postProvider.getPostList();
//     return ListView.builder(itemBuilder: (context, index) {
//       final post = postDatas[index];
//       return Row(
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(widget.text),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width * 4 / 7,
//             height: 50,
//             // child: Newbutton(),
//             child: DropdownSearch<String>(
//                 onSaved: print,
//                 showSearchBox: true,
//                 mode: Mode.MENU,
//                 showSelectedItem: true,
//                 items: postDatas,
//                 label: "Menu mode",
//                 popupItemDisabled: (String s) => s.startsWith('I'),
//                 onChanged: print,
//                 selectedItem: postDatas[0]),
//           ),
//         ],
//       );
//       ;
//     });
//   }

//   // Widget _newButton() {
//   //   return DropdownSearch<String>(
//   //       onSaved: print,
//   //       showSearchBox: true,
//   //       mode: Mode.MENU,
//   //       showSelectedItem: true,
//   //       items: _data,
//   //       label: "Menu mode",
//   //       popupItemDisabled: (String s) => s.startsWith('I'),
//   //       onChanged: print,
//   //       selectedItem: _data[0]);
//   // }
// }

// // class DropboxText extends StatelessWidget {
// //   DropboxText({Key? key, required this.text}) : super(key: key);
// //   String text;

// //   List<String> _data = [];
// //   void initState() {
// //     test();
// //     // super.initState();
// //   }

// //   dynamic test() async {
// //     var uriResponse = await http.get(
// //       Uri.parse(
// //         'http://10.0.2.2:5000/api/category/',
// //       ),
// //     );

// //     var json = jsonDecode(uriResponse.body);
// //     var user = User.fromJson(json);
// //     int len = user.result.length;
// //     // if (mounted)
// //     // this.setState(() {
// //     //   for (int i = 0; i < len; i++) {
// //     //     data += [user.result[i]['category']];
// //     //   }
// //     // });
// //     for (int i = 0; i < len; i++) {
// //       _data += [user.result[i]['category']];
// //     }
// //     // setState(() {
// //     // for (int i = 0; i < len; i++) {
// //     //   data += [user.result[i]['category']];
// //     // }
// //     // });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         SizedBox(
// //           width: 100,
// //           child: Text(text),
// //         ),
// //         Container(
// //           width: MediaQuery.of(context).size.width * 4 / 7,
// //           height: 50,
// //           // child: Newbutton(),
// //           child: _newButton(),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _newButton() {
// //     return DropdownSearch<String>(
// //         onSaved: print,
// //         showSearchBox: true,
// //         mode: Mode.MENU,
// //         showSelectedItem: true,
// //         items: _data,
// //         label: "Menu mode",
// //         popupItemDisabled: (String s) => s.startsWith('I'),
// //         onChanged: print,
// //         selectedItem: _data[0]);
// //   }
// // }


// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'package:plms_start/screens/models/model.dart';
// import 'package:plms_start/screens/provider/data_Provider.dart';

// import 'dart:convert';

// import 'package:provider/provider.dart';

// class DropboxText extends StatefulWidget {
//   DropboxText({Key? key}) : super(key: key);

//   @override
//   _DropboxTextState createState() => _DropboxTextState();
// }

// class _DropboxTextState extends State<DropboxText> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PostProvider>(builder: (context, provider, widget) {
//       return Container();
//     });
//   }
// }
