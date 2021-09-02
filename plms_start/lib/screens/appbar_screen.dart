import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                color: Colors.green,
                onPressed: () {
                  Get.offAllNamed("/home");
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp),
              ),
              Text(
                'Punch Issue',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed('/');
            },
            child: Text('Logout'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xff5C8893),
            ),
          ),
        ],
      ),
    );
  }
}
