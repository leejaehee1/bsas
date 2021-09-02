import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:plms_start/pages/utils/button_confirm.dart';
import 'package:plms_start/pages/utils/button_success.dart';
import 'package:plms_start/pages/utils/header_issue.dart';

// import 'components/screenList.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            title: "title",
          ),
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Punch Issue Successfully Created.")
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      "Do you want to duplicate this issue with same condition?")
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "All conditins you created will be duplicated except the attachments.",
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                              SuccessButton(
                                  buttonname1: "No", buttonname2: "Yes")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
