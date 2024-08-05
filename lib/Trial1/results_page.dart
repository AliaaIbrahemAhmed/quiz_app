import 'package:flutter/material.dart';
import 'package:quiz_app/Trial1/question_result.dart';

class Results extends StatelessWidget {
  Results(this.actualAns, this.rightAns, this.questions, {super.key})
      : correctAns = correctAnswers(actualAns, rightAns);

  final List<int> actualAns;
  final List<int> rightAns;
  final List<List<String>> questions;
  final int correctAns;

  static int correctAnswers(List<int> list1, List<int> list2) {
    int matchingIndicesCount = 0;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] == list2[i]) {
        matchingIndicesCount++;
      }
    }
    return matchingIndicesCount;
  }

  Widget question(int num) {
    return Column(
      children: [
        Text(
          questions[num][0],
          style: const TextStyle(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          questions[num][rightAns[num - 1]],
          style: const TextStyle(fontSize: 24, color: Colors.green),
          textAlign: TextAlign.center,
        ),
        if (rightAns != actualAns)
          Text(
            questions[num][actualAns[num - 1]],
            style: const TextStyle(fontSize: 24, color: Colors.red),
            textAlign: TextAlign.center,
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 81, 0, 135),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('Correct answers: $correctAns'),
                QuestionResult(1, rightAns[0] == actualAns[0], question),
                QuestionResult(2, rightAns[1] == actualAns[1], question),
                QuestionResult(3, rightAns[2] == actualAns[2], question),
                QuestionResult(4, rightAns[3] == actualAns[3], question),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
