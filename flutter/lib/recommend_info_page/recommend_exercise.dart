import 'package:flutter/material.dart';


class RecommendExercise extends StatefulWidget {
  @override
  _RecommendExercisePageState createState() => _RecommendExercisePageState();
}

class _RecommendExercisePageState extends State<RecommendExercise> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43aa8b),
        title: Text('추천운동',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
