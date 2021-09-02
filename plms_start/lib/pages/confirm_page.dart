import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:plms_start/pages/utils/button_confirm.dart';
import 'package:plms_start/pages/utils/header_issue.dart';

// import 'components/screenList.dart';

class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            title: "title",
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 4 / 7,
              color: Color(0xFFE6E6E6),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
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
                            Row(
                              children: [
                                Text("Punch Issue Confirmation"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Plsease confirm created Punch Issue"),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text("Punch ID"),
                                SizedBox(
                                  width: 58,
                                ),
                                Text("DW-IN-4023"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Issued Date"),
                                SizedBox(
                                  width: 40,
                                ),
                                Text("DW-IN-4023"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Issued By"),
                                SizedBox(
                                  width: 53,
                                ),
                                Text("DW-IN-4023"),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 150,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("data"),
                                          Text("data"),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        children: [
                                          Text("data"),
                                          Text("data"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("data"),
                                          Text("data"),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        children: [
                                          Text("data"),
                                          Text("data"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("data"),
                                          Text("data"),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        children: [
                                          Text("data"),
                                          Text("data"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ConfirmButton(

                        // name: '/',
                        buttonname1: "Cancel",
                        buttonname2: "Confirm")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
