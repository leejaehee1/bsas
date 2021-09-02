import 'package:flutter/material.dart';

class ListComponent extends StatelessWidget {
  ListComponent({
    Key? key,
    required this.title,
    required this.data1,
    required this.data2,
    required this.colors,
  }) : super(key: key);

  final int colors;
  final String title;
  final String data1;
  final String data2;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: MediaQuery.of(context).size.height * 1.09 / 8,
      // width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 17, top: 3, bottom: 8, right: 10),
        child: Container(
          // height: MediaQuery.of(context).size.height * 1 / 8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(colors),
                offset: Offset(-7, 0.3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Color(colors),
                              ),
                            ),
                            Text(data1),
                            Text(data2),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textTile(String datas) {
    return Text(
      datas,
      // style: TextStyle(fontSize: 20),
    );
  }
}
