import 'package:flutter/material.dart';
import 'package:quiz_app/Trial2/questions.dart';

class QuestionResult extends StatelessWidget {
  const QuestionResult(this.actualAns, this.correct, this.questionIndex,
      {super.key})
      : color = correct
            ? const Color.fromARGB(255, 116, 157, 255)
            : const Color.fromARGB(255, 255, 90, 241);
  final int questionIndex;
  final bool correct;
  final String actualAns;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          width: 20,
          child: Text(
            (questionIndex + 1).toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questions[questionIndex].questionText,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                actualAns,
                style: TextStyle(color: color),
              ),
              Text(
                questions[questionIndex].answers[0],
                style:
                    const TextStyle(color: Color.fromARGB(255, 116, 157, 255)),
              )
            ],
          ),
        )
      ],
    );
  }
}
