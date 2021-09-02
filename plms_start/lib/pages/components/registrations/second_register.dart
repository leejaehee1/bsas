import 'package:flutter/material.dart';
import 'package:plms_start/pages/utils/checkbox_register2.dart';

class SecondRegister extends StatelessWidget {
  const SecondRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      color: Color(0xFFE6E6E6),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xffB7C5B9),
                offset: Offset(-7, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Text("프로그램 서비스 이용약관"),
                    Container(
                      color: Color(0xffeeeeee),
                      height: 200,
                      child: ListView(
                        children: [Text('data')],
                      ),
                    ),
                    CheckBoxButton2(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
